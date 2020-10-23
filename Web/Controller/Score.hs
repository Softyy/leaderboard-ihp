module Web.Controller.Score where

import Web.Controller.Prelude
import Web.View.Score.Index
import Web.View.Score.New
import Web.View.Score.Edit
import Web.View.Score.Show

instance Controller ScoreController where
    action ScoresAction = do
        score <- query @Score |> fetch
        render IndexView { .. }

    action NewScoreAction { leaderboardId } = do
        let score = newRecord
                |> set #leaderboardId leaderboardId
        leaderboard <- fetch leaderboardId
        render NewView { .. }

    action ShowScoreAction { scoreId } = do
        score <- fetch scoreId
        render ShowView { .. }

    action EditScoreAction { scoreId } = do
        score <- fetch scoreId
        render EditView { .. }

    action UpdateScoreAction { scoreId } = do
        score <- fetch scoreId
        score
            |> buildScore
            |> ifValid \case
                Left score -> render EditView { .. }
                Right score -> do
                    score <- score |> updateRecord
                    setSuccessMessage "Score updated"
                    redirectTo EditScoreAction { .. }

    action CreateScoreAction = do
        let score = newRecord @Score
        score
            |> buildScore
            |> ifValid \case
                Left score -> do
                    leaderboard <- fetch (get #leaderboardId score)
                    render NewView { .. } 
                Right score -> do
                    score <- score |> createRecord
                    setSuccessMessage "Score created"
                    redirectTo ShowLeaderboardAction {leaderboardId = get #leaderboardId score}

    action DeleteScoreAction { scoreId } = do
        score <- fetch scoreId
        deleteRecord score
        setSuccessMessage "Score deleted"
        redirectTo ScoresAction

buildScore score = score
    |> fill @["leaderboardId","name","score"]

module Web.Controller.Leaderboard where

import Web.Controller.Prelude
import Web.View.Leaderboard.Index
import Web.View.Leaderboard.New
import Web.View.Leaderboard.Edit
import Web.View.Leaderboard.Show

instance Controller LeaderboardController where
    action LeaderboardsAction = do
        leaderboard <- query @Leaderboard |> fetch
        render IndexView { .. }

    action NewLeaderboardAction = do
        let leaderboard = newRecord
        render NewView { .. }

    action ShowLeaderboardAction { leaderboardId } = do
        leaderboard <- fetch leaderboardId
                >>= pure . modify #scores (orderByDesc #score)
                >>= fetchRelated #scores
        render ShowView { .. }

    action EditLeaderboardAction { leaderboardId } = do
        leaderboard <- fetch leaderboardId
        render EditView { .. }

    action UpdateLeaderboardAction { leaderboardId } = do
        leaderboard <- fetch leaderboardId
        leaderboard
            |> buildLeaderboard
            |> ifValid \case
                Left leaderboard -> render EditView { .. }
                Right leaderboard -> do
                    leaderboard <- leaderboard |> updateRecord
                    setSuccessMessage "Leaderboard updated"
                    redirectTo EditLeaderboardAction { .. }

    action CreateLeaderboardAction = do
        let leaderboard = newRecord @Leaderboard
        leaderboard
            |> buildLeaderboard
            |> ifValid \case
                Left leaderboard -> render NewView { .. } 
                Right leaderboard -> do
                    leaderboard <- leaderboard |> createRecord
                    setSuccessMessage "Leaderboard created"
                    redirectTo LeaderboardsAction

    action DeleteLeaderboardAction { leaderboardId } = do
        leaderboard <- fetch leaderboardId
        deleteRecord leaderboard
        setSuccessMessage "Leaderboard deleted"
        redirectTo LeaderboardsAction

buildLeaderboard leaderboard = leaderboard
    |> fill @["owner","name"]

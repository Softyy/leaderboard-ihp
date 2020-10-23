module Web.Types where
import IHP.Prelude
import qualified IHP.Controller.Session
import qualified IHP.ControllerSupport as ControllerSupport
import IHP.ModelSupport
import Application.Helper.Controller
import IHP.ViewSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)

data ViewContext = ViewContext
    { requestContext :: ControllerSupport.RequestContext
    , flashMessages :: [IHP.Controller.Session.FlashMessage]
    , controllerContext :: ControllerSupport.ControllerContext
    , layout :: Layout
    }

data LeaderboardController
    = LeaderboardsAction
    | NewLeaderboardAction
    | ShowLeaderboardAction { leaderboardId :: !(Id Leaderboard) }
    | CreateLeaderboardAction
    | EditLeaderboardAction { leaderboardId :: !(Id Leaderboard) }
    | UpdateLeaderboardAction { leaderboardId :: !(Id Leaderboard) }
    | DeleteLeaderboardAction { leaderboardId :: !(Id Leaderboard) }
    deriving (Eq, Show, Data)

data ScoreController
    = ScoresAction
    | NewScoreAction { leaderboardId :: !(Id Leaderboard)}
    | ShowScoreAction { scoreId :: !(Id Score) }
    | CreateScoreAction
    | EditScoreAction { scoreId :: !(Id Score) }
    | UpdateScoreAction { scoreId :: !(Id Score) }
    | DeleteScoreAction { scoreId :: !(Id Score) }
    deriving (Eq, Show, Data)

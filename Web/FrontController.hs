module Web.FrontController where
import IHP.RouterPrelude
import IHP.ControllerSupport
import Generated.Types
import Web.Types

-- Controller Imports
import Web.Controller.Score
import Web.Controller.Leaderboard
import IHP.Welcome.Controller

instance FrontController WebApplication where
    controllers = 
        [ startPage LeaderboardsAction
        -- Generator Marker
        , parseRoute @ScoreController
        , parseRoute @LeaderboardController
        ]

instance InitControllerContext WebApplication

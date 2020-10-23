module Web.Routes where
import IHP.RouterPrelude
import Generated.Types
import Web.Types

-- Generator Marker
instance AutoRoute LeaderboardController
type instance ModelControllerMap WebApplication Leaderboard = LeaderboardController

instance AutoRoute ScoreController
type instance ModelControllerMap WebApplication Score = ScoreController


module Web.View.Leaderboard.New where
import Web.View.Prelude

data NewView = NewView { leaderboard :: Leaderboard }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={LeaderboardsAction}>Leaderboards</a></li>
                <li class="breadcrumb-item active">New Leaderboard</li>
            </ol>
        </nav>
        <h1>New Leaderboard</h1>
        {renderForm leaderboard}
    |]

renderForm :: Leaderboard -> Html
renderForm leaderboard = formFor leaderboard [hsx|
    {(textField #owner)}
    {(textField #name)}
    {submitButton}
|]

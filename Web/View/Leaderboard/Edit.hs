module Web.View.Leaderboard.Edit where
import Web.View.Prelude

data EditView = EditView { leaderboard :: Leaderboard }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={LeaderboardsAction}>Leaderboards</a></li>
                <li class="breadcrumb-item active">Edit Leaderboard</li>
            </ol>
        </nav>
        <h1>Edit Leaderboard</h1>
        {renderForm leaderboard}
    |]

renderForm :: Leaderboard -> Html
renderForm leaderboard = formFor leaderboard [hsx|
    {(textField #owner)}
    {(textField #name)}
    {submitButton}
|]

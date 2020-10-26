module Web.View.Score.Edit where
import Web.View.Prelude

data EditView = EditView { score :: Score }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ShowLeaderboardAction (get #leaderboardId score)}>Leaderboard</a></li>
                <li class="breadcrumb-item active">Edit Score</li>
            </ol>
        </nav>
        <h1>Edit {get #name score}'s Score</h1>
        {renderForm score}
    |]

renderForm :: Score -> Html
renderForm score = formFor score [hsx|
    {(hiddenField #leaderboardId)}
    {(hiddenField #name)}
    {(textField #score)}
    {submitButton}
|]

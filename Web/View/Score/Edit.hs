module Web.View.Score.Edit where
import Web.View.Prelude

data EditView = EditView { score :: Score }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ScoresAction}>Scores</a></li>
                <li class="breadcrumb-item active">Edit Score</li>
            </ol>
        </nav>
        <h1>Edit Score</h1>
        {renderForm score}
    |]

renderForm :: Score -> Html
renderForm score = formFor score [hsx|
    {(textField #leaderboardId)}
    {(textField #name)}
    {(textField #score)}
    {submitButton}
|]

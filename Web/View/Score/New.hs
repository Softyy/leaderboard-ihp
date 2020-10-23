module Web.View.Score.New where
import Web.View.Prelude

data NewView = NewView { score :: Score, leaderboard :: Leaderboard }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ScoresAction}>Scores</a></li>
                <li class="breadcrumb-item active">New Score</li>
            </ol>
        </nav>
        <h1>New Score for <q>{get #name leaderboard}</q></h1>
        {renderForm score}
    |]

renderForm :: Score -> Html
renderForm score = formFor score [hsx|
    {(hiddenField #leaderboardId)}
    {(textField #name)}
    {(textField #score)}
    {submitButton}
|]

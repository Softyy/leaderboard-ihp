module Web.View.Score.Show where
import Web.View.Prelude

data ShowView = ShowView { score :: Score }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ScoresAction}>Scores</a></li>
                <li class="breadcrumb-item active">Show Score</li>
            </ol>
        </nav>
        <h1>Show Score</h1>
        <p>{score}</p>
    |]

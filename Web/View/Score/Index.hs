module Web.View.Score.Index where
import Web.View.Prelude

data IndexView = IndexView { score :: [Score] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={ScoresAction}>Scores</a></li>
            </ol>
        </nav>
        <h1>Scores</h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Score</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach score renderScore}</tbody>
            </table>
        </div>
    |]


renderScore score = [hsx|
    <tr>
        <td>{score}</td>
        <td><a href={ShowScoreAction (get #id score)}>Show</a></td>
        <td><a href={EditScoreAction (get #id score)} class="text-muted">Edit</a></td>
        <td><a href={DeleteScoreAction (get #id score)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]

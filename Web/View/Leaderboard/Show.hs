module Web.View.Leaderboard.Show where
import Web.View.Prelude

data ShowView = ShowView { leaderboard :: Include "scores" Leaderboard }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={LeaderboardsAction}>Leaderboards</a></li>
                <li class="breadcrumb-item active">{get #name leaderboard}</li>
            </ol>
        </nav>
        <h1>{get #name leaderboard}</h1>
        <a href={NewScoreAction (get #id leaderboard)}>Add New Score</a>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Score</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach (get #scores leaderboard) renderScore}</tbody>
            </table>
        </div>
        <p></p>
    |]

renderScore score = [hsx|<tr>
    <td> <a href={EditScoreAction (get #id score)}>{get #name score}</a>  </td>
    <td> {get #score score} </td>
    <td></td>
    <td><a href={DeleteScoreAction (get #id score)} class="js-delete text-muted">Delete</a></td>
</tr>|]
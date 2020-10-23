module Web.View.Leaderboard.Index where
import Web.View.Prelude

data IndexView = IndexView { leaderboard :: [Leaderboard] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={LeaderboardsAction}>Leaderboards</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewLeaderboardAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Leaderboard</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach leaderboard renderLeaderboard}</tbody>
            </table>
        </div>
    |]


renderLeaderboard leaderboard = [hsx|
    <tr>
        <td><a href={ShowLeaderboardAction (get #id leaderboard)}>{get #name leaderboard}</a></td>
        <td></td>
        <td><a href={EditLeaderboardAction (get #id leaderboard)} class="text-muted">Edit</a></td>
        <td><a href={DeleteLeaderboardAction (get #id leaderboard)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]

import UIKit

final class UsersViewController: UITableViewController {
    var presenter: UserPresenter!
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        tableView.register(
            UINib(nibName: String(describing: UserViewCell.self), bundle: nil),
            forCellReuseIdentifier: String(describing: UserViewCell.self)
        )
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        tableView.rowHeight = UITableView.automaticDimension
        onRefresh()
    }
    
    @objc
    func onRefresh() {
        presenter.getUsers()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserViewCell.self), for: indexPath) as! UserViewCell
        let user = users[indexPath.row]
        cell.setup(with: user)
        return cell
    }
}

extension UsersViewController: UsersView {
    func display(_ users: [User]) {
        self.users = users
        tableView.reloadData()
    }
    
    func display(isLoding: Bool) {
        if isLoding {
            tableView.refreshControl?.beginRefreshing()
        } else {
            tableView.refreshControl?.endRefreshing()
        }
    }
}

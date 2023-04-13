import Foundation

protocol UsersView: AnyObject {
    func display(_ users: [User])
    func display(isLoding: Bool)
}

final class UserPresenter {
    weak  var view: UsersView?
    
    func getUsers() {
        view?.display(isLoding: true)
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        guard url != nil else {
            return
        }
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(UsersResult.self, from: data)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.view?.display(result.users)
                    self.view?.display(isLoding: false)
                })
            } catch {
                DispatchQueue.main.async {
                    self.view?.display(isLoding: false)
                }
            }
        }
        task.resume()
    }
}

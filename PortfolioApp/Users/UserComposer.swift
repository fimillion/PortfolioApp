import UIKit

final class UserComposer {
    
    private init() {}
    
    static func build() -> UIViewController {
        let presenter = UserPresenter()
        let controller = UsersViewController()
        controller.presenter = presenter
        presenter.view = controller
        return controller
    }
}

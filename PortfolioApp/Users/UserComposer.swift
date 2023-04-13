import UIKit

final class UserComposer {
    
    static func build () -> UIViewController {
        let presenter = UserPresenter()
        let controller = UsersViewController(nibName: "UsersViewController", bundle: nil)
        controller.presenter = presenter
        presenter.view = controller
        return controller
    }
}

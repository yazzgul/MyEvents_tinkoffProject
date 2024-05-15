import UIKit

protocol LoginViewControllerCoordinatorOutput: AnyObject {
    func coordinatorDidLogin()
    func coordinatorWantsToSignUp()
}

class LoginViewControllerCoordinator: BaseCoodinator {
    private var navigationController: UINavigationController
    weak var output: LoginViewControllerCoordinatorOutput?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        let loginModel = LoginViewModel()
        let loginVC = LoginViewController(viewModel: loginModel)
        loginVC.loginViewControllerCoordinator = self
        navigationController.pushViewController(loginVC, animated: true)
    }

    func goToSignUpScreen() {
        output?.coordinatorWantsToSignUp()
    }

    func goToEventsTabBar() {
        output?.coordinatorDidLogin()
    }
}

import UIKit

class SignUpViewControllerCoordinator: BaseCoodinator {
    private var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        let signUpModel = SignUpModel()
        let signUpVC = SignUpViewController(viewModel: signUpModel)
        signUpVC.signUpViewControllerCoordinator = self
        navigationController.pushViewController(signUpVC, animated: true)
    }

    func backToLoginScreen() {
        let loginViewControllerCoordinator = LoginViewControllerCoordinator(navigationController: navigationController)
        loginViewControllerCoordinator.backToLogin(coordinator: self)
    }
}

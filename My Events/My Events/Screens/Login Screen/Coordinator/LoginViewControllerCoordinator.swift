import UIKit

class LoginViewControllerCoordinator: BaseCoodinator {
    private var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        let loginModel = LoginModel()
        let loginVC = LoginViewController(viewModel: loginModel)
        loginVC.loginViewControllerCoordinator = self
        navigationController.pushViewController(loginVC, animated: true)
    }

    func goToSignUpScreen() {
        let signUpViewControllerCoordinator = SignUpViewControllerCoordinator(navigationController: navigationController)
        add(coordinator: signUpViewControllerCoordinator)
        signUpViewControllerCoordinator.start()
    }
    
    func backToLogin(coordinator: BaseCoodinator) {
        remove(coordinator: coordinator)
        navigationController.popViewController(animated: true)
    }

    func goToEventsTabBar() {
        let eventsTabBarControllerCoordinator = EventsTabBarControllerCoordinator(navigationController: navigationController)
        eventsTabBarControllerCoordinator.start()
    }

}

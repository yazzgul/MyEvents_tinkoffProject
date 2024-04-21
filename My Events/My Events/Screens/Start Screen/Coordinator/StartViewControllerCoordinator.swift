import UIKit

class StartViewControllerCoordinator: BaseCoodinator {

    private var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        let startVC = StartViewController()
        startVC.startViewControllerCoordinator = self
        navigationController.pushViewController(startVC, animated: true)
    }

    func goToLoginScreen() {
        let loginViewControllerCoordinator = LoginViewControllerCoordinator(navigationController: navigationController)
        add(coordinator: loginViewControllerCoordinator)
        loginViewControllerCoordinator.start()
    }

}

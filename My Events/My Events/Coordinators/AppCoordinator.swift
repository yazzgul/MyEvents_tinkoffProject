import UIKit

class AppCoordinator: BaseCoodinator {

    private var window: UIWindow

    var isLogged = true

    private var navigationController: UINavigationController = {
        let navigationController = UINavigationController()

        return navigationController
    }()

    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }

    override func start() {
        if isLogged {
            let startViewControllerCoordinator = StartViewControllerCoordinator(navigationController: navigationController)
            add(coordinator: startViewControllerCoordinator)
            startViewControllerCoordinator.start()
        }
        else {
            
        }

    }

}

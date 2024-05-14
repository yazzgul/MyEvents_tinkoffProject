import UIKit

class AppCoordinator: BaseCoodinator {

    private var window: UIWindow

    var isLogged = false

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
        if !childCoordinators.isEmpty {
            childCoordinators.removeAll()
        }
        if !isLogged {
            let startViewControllerCoordinator = StartViewControllerCoordinator(navigationController: navigationController)
            add(coordinator: startViewControllerCoordinator)
            startViewControllerCoordinator.start()
        } else {
            let eventsTabBarControllerCoordinator = EventsTabBarControllerCoordinator(navigationController: navigationController)
            add(coordinator: eventsTabBarControllerCoordinator)
            eventsTabBarControllerCoordinator.start()
        }

    }

}

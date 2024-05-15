import UIKit

class AppCoordinator: BaseCoodinator {

    private var window: UIWindow
    var startViewControllerCoordinator: StartViewControllerCoordinator?
    var eventsTabBarControllerCoordinator: EventsTabBarControllerCoordinator?

    private var isLogged = false

    private var rootNavigationController: UINavigationController?

    init(window: UIWindow) {
        self.window = window
    }

    override func start() {

        let navigationController = UINavigationController()
        rootNavigationController = navigationController

        if !childCoordinators.isEmpty {
            childCoordinators.removeAll()
        }
        if !isLogged {
            
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
            startViewControllerCoordinator = StartViewControllerCoordinator(navigationController: navigationController)
            startViewControllerCoordinator?.output = self
            guard let startViewControllerCoordinator else { return }
            add(coordinator: startViewControllerCoordinator)
            startViewControllerCoordinator.start()
        } else {
            let eventsTabBarController = EventsTabBarController()
            window.rootViewController = eventsTabBarController
            window.makeKeyAndVisible()

            let coordinator = EventsTabBarControllerCoordinator(eventsTabBarController: eventsTabBarController)
            coordinator.output = self
            eventsTabBarControllerCoordinator = coordinator

            add(coordinator: coordinator)
            coordinator.start()
        }
    }
}

extension AppCoordinator: EventsTabBarControllerCoordinatorOutput {
    func signOut() {
        isLogged = false
        eventsTabBarControllerCoordinator.map { remove(coordinator: $0) }
        start()
    }
}

extension AppCoordinator: StartViewControllerCoordinatorOutput {
    func coordinatorDidLogin() {
        isLogged = true
        startViewControllerCoordinator.map { remove(coordinator: $0) }
        start()
    }
}

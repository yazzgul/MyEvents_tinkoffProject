import UIKit

protocol EventsTabBarControllerCoordinatorOutput: AnyObject {
    func signOut()
}

class EventsTabBarControllerCoordinator: BaseCoodinator {

    private let eventsTabBarController: EventsTabBarController

    let mainViewControllerCoordinator = MainViewControllerCoordinator(navigationController: UINavigationController())
    let profileViewControllerCoordinator = ProfileViewControllerCoordinator(navigationController: UINavigationController())
    weak var output: EventsTabBarControllerCoordinatorOutput?

    init(eventsTabBarController: EventsTabBarController) {
        self.eventsTabBarController = eventsTabBarController
        super.init()
    }

    override func start() {

        if !childCoordinators.isEmpty {
            childCoordinators.removeAll()
        }

        let mainNavigationController = UINavigationController()
        mainNavigationController.tabBarItem = UITabBarItem(title: "Main", image: nil, tag: 1)
        mainViewControllerCoordinator.navigationController = mainNavigationController
        mainViewControllerCoordinator.start()

        let profileNavigationController = UINavigationController()
        profileViewControllerCoordinator.output = self
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: nil, tag: 2)
        profileViewControllerCoordinator.navigationController = profileNavigationController
        profileViewControllerCoordinator.start()

        let tabBarControllers = [mainNavigationController, profileNavigationController]
        eventsTabBarController.viewControllers = tabBarControllers
    }

}

extension EventsTabBarControllerCoordinator: ProfileViewControllerCoordinatorOutput {
    func signOut() {
        output?.signOut()
    }
}

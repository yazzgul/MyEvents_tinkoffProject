import UIKit

class EventsTabBarControllerCoordinator: BaseCoodinator {

    private var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {

        if !childCoordinators.isEmpty {
            childCoordinators.removeAll()
        }

        let eventsTabBarController = EventsTabBarController()
        let mainNavigationController = UINavigationController()
        mainNavigationController.tabBarItem = UITabBarItem(title: "Main", image: nil, tag: 1)
        let mainViewControllerCoordinator = MainViewControllerCoordinator(navigationController: mainNavigationController)
        mainViewControllerCoordinator.start()

        let profileNavigationController = UINavigationController()
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: nil, tag: 2)
        let profileViewControllerCoordinator = ProfileViewControllerCoordinator(navigationController: profileNavigationController)
        profileViewControllerCoordinator.start()

        let tabBarControllers = [mainNavigationController, profileNavigationController]
        eventsTabBarController.viewControllers = tabBarControllers

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = eventsTabBarController
            sceneDelegate.window?.makeKeyAndVisible()
        }

    }

}

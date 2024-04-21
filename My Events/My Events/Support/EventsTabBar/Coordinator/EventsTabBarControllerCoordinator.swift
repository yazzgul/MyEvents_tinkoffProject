import UIKit

class EventsTabBarControllerCoordinator: BaseCoodinator {

    private var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {

        let eventsTabBarController = EventsTabBarController()

        let mainModel = MainModel()
        let mainVC = MainViewController(viewModel: mainModel)
        let mainNavigationController = UINavigationController(rootViewController: mainVC)
        mainNavigationController.tabBarItem = UITabBarItem(title: "Main", image: nil, tag: 1)
        let mainViewControllerCoordinator = MainViewControllerCoordinator(navigationController: mainNavigationController)
        mainVC.mainViewControllerCoordinator = mainViewControllerCoordinator
        add(coordinator: mainViewControllerCoordinator)

        let profileModel = ProfileModel()
        let profileVC = ProfileViewController(viewModel: profileModel)
        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: nil, tag: 2)
        let profileViewControllerCoordinator = ProfileViewControllerCoordinator(navigationController: profileNavigationController)
        profileVC.profileViewControllerCoordinator = profileViewControllerCoordinator
        add(coordinator: profileViewControllerCoordinator)

        let tabBarControllers = [mainNavigationController, profileNavigationController]
        eventsTabBarController.viewControllers = tabBarControllers

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = eventsTabBarController
            sceneDelegate.window?.makeKeyAndVisible()
        }

    }

}

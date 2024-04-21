import Foundation
import UIKit

class EventsTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        configureTabBar()
    }

    func configureTabBar() {
        let mainModel = MainModel()
        let mainVC = MainViewController(viewModel: mainModel)
        let mainNavigationController = UINavigationController(rootViewController: mainVC)
        let mainItem = UITabBarItem(title: "Main", image: nil, tag: 1)
        mainNavigationController.tabBarItem = mainItem

        let profileModel = ProfileModel()
        let profileVC = ProfileViewController(viewModel: profileModel)
        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        let profileItem = UITabBarItem(title: "Profile", image: nil, tag: 2)
        profileNavigationController.tabBarItem = profileItem


        let tabBarControllers = [mainNavigationController, profileNavigationController]
        self.viewControllers = tabBarControllers
    }

}

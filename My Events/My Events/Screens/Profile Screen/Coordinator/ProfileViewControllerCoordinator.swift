import UIKit

class ProfileViewControllerCoordinator: BaseCoodinator {

    private var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        let profileModel = ProfileModel()
        let profileVC = ProfileViewController(viewModel: profileModel)
        profileVC.profileViewControllerCoordinator = self
        add(coordinator: self)
        navigationController.pushViewController(profileVC, animated: true)

    }

    func signOut() {

        print("profile coordinator 2")

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {

            print("profile coordinator 3")

            let appCoordinator = AppCoordinator(window: sceneDelegate.window ?? UIWindow(windowScene: windowScene))
            print("profile coordinator 4")

            appCoordinator.isLogged = false
            appCoordinator.start()
            
        }
    }

}

import UIKit

protocol ProfileViewControllerCoordinatorOutput: AnyObject {
    func signOut()
}

class ProfileViewControllerCoordinator: BaseCoodinator {

    var navigationController: UINavigationController
    weak var output: ProfileViewControllerCoordinatorOutput?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        let profileModel = ProfileViewModel()
        let profileVC = ProfileViewController(viewModel: profileModel)
        profileVC.profileViewControllerCoordinator = self
        add(coordinator: self)
        navigationController.pushViewController(profileVC, animated: true)

    }

    func signOut() {
        output?.signOut()
    }
}

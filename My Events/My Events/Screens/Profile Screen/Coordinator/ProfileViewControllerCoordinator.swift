import UIKit

protocol ProfileViewControllerCoordinatorOutput: AnyObject {
    func signOut()
}

class ProfileViewControllerCoordinator: BaseCoodinator {

    var navigationController: UINavigationController

    weak var output: ProfileViewControllerCoordinatorOutput?

    var favouriteViewControllerCoordinator: FavouriteViewControllerCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        let profileModel = ProfileViewModel()
        let profileVC = ProfileViewController(viewModel: profileModel)
        profileVC.delegate = self
        add(coordinator: self)
        navigationController.pushViewController(profileVC, animated: true)
    }

}
extension ProfileViewControllerCoordinator: ProfileViewControllerDelegate {
    func goToFavouriteTableScreen() {
        let coordinator = FavouriteViewControllerCoordinator(navigationController: navigationController)
        coordinator.output = self
        favouriteViewControllerCoordinator = coordinator

        add(coordinator: coordinator)
        coordinator.start()
    }
    
    func signOut() {
        output?.signOut()
    }
    func deleteAccountSignOut() {
        output?.signOut()
    }
}
extension ProfileViewControllerCoordinator: FavouriteViewControllerCoordinatorOutput {
    func coordinatorWantsToOpenTableDetailScreen() {
        let favouriteTableDetailViewModel = FavouritesTableDetailViewModel()
        let favouriteTableDetailVC = FavouritesTableDetailViewController(viewModel: favouriteTableDetailViewModel)
        favouriteTableDetailVC.delegate = favouriteViewControllerCoordinator
        favouriteTableDetailVC.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(favouriteTableDetailVC, animated: true)
    }
    func coordinatorWantsToBackToTableFromTableDetailScreen() {
        navigationController.popViewController(animated: true)
    }
    func coordinatorWantsToBackToProfileScreen() {
        favouriteViewControllerCoordinator.map { remove(coordinator: $0) }
        navigationController.popViewController(animated: true)
    }
    
}

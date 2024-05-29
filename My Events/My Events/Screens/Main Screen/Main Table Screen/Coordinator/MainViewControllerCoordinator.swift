import UIKit

class MainViewControllerCoordinator: BaseCoodinator {

    var navigationController: UINavigationController

    var mainTableDetailCoordinator: MainTableDetailCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        let mainModel = MainViewModel()
        let mainVC = MainViewController(viewModel: mainModel)
        mainVC.delegate = self
        add(coordinator: self)
        navigationController.pushViewController(mainVC, animated: true)

    }

}
extension MainViewControllerCoordinator: MainViewControllerDelegate {
    func goToTableDetailScreen() {
        let coordinator = MainTableDetailCoordinator(navigationController: navigationController)
        coordinator.output = self
        mainTableDetailCoordinator = coordinator

        add(coordinator: coordinator)
        coordinator.start()
    }
}
extension MainViewControllerCoordinator: MainTableDetailCoordinatorOutput {
    func coordinatorWantsToBackToTable() {
        mainTableDetailCoordinator.map { remove(coordinator: $0) }
        navigationController.popViewController(animated: true)
    }
}

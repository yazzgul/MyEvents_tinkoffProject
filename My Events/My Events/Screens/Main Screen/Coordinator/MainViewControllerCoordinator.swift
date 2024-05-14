import UIKit

class MainViewControllerCoordinator: BaseCoodinator {

    private var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        let mainModel = MainModel()
        let mainVC = MainViewController(viewModel: mainModel)
        mainVC.mainViewControllerCoordinator = self
        add(coordinator: self)
        navigationController.pushViewController(mainVC, animated: true)

    }

}

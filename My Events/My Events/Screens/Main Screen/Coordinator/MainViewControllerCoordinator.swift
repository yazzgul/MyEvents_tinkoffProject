import UIKit

class MainViewControllerCoordinator: BaseCoodinator {

    var navigationController: UINavigationController

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
    
}

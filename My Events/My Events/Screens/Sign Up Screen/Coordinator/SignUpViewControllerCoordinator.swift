import UIKit

protocol SignUpViewControllerCoordinatorOuptut: AnyObject {
    func coordinatorDidSignUp()
    func coordinatorWantsToOpenLogin()
}

class SignUpViewControllerCoordinator: BaseCoodinator {
    private var navigationController: UINavigationController
    weak var output: SignUpViewControllerCoordinatorOuptut?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        let signUpModel = SignUpViewModel()
        let signUpVC = SignUpViewController(viewModel: signUpModel)
        signUpVC.signUpViewControllerCoordinator = self
        navigationController.pushViewController(signUpVC, animated: true)
    }

    func backToLoginScreen() {
        output?.coordinatorWantsToOpenLogin()
    }
    
    func goToEventsTabBar() {
        output?.coordinatorDidSignUp()
    }
}

import Foundation
import UIKit

class Coordinator {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func goToLoginScreen() {
        let loginModel = LoginModel()
        let loginVC = LoginViewController()
        navigationController.pushViewController(loginVC, animated: true)
    }
    
}

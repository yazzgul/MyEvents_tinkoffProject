import UIKit

class LoginViewController: UIViewController {

    private let contentView: LoginView = .init()
    private let viewModel: LoginModel

    weak var loginViewControllerCoordinator: LoginViewControllerCoordinator?

    init(viewModel: LoginModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        navigationItem.hidesBackButton = true

        contentView.signUpButtonDelegate = self
        contentView.loginButtonDelegate = self
    }

}
extension LoginViewController: SignUpButtonLoginViewDelegate, LoginButtonLoginViewDelegate {

    func loginButtonDidPressed() {
        loginViewControllerCoordinator?.goToEventsTabBar()
    }

    func signUpButtonDidPressed() {
        loginViewControllerCoordinator?.goToSignUpScreen()
    }
}

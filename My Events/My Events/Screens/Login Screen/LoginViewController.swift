import UIKit
import Combine

class LoginViewController: UIViewController {

    private let contentView: LoginView = .init()
    private let viewModel: LoginModel

    private var cancellable: AnyCancellable?

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

        succesfulyEnterLogin()
    }

    func succesfulyEnterLogin() {
        cancellable = viewModel.$successfulyEnterLogin
            .sink { bool in
                if bool {
                    self.loginViewControllerCoordinator?.goToEventsTabBar()
                } else {
                    print("Что то пошло не так! Не удалось войти.")
                }
            }
    }

}
extension LoginViewController: SignUpButtonLoginViewDelegate, LoginButtonLoginViewDelegate {
    func loginButtonDidPressed(email: String, password: String) {
        viewModel.signInUser(email: email, password: password)
    }

    func signUpButtonDidPressed() {
        loginViewControllerCoordinator?.goToSignUpScreen()
    }
}

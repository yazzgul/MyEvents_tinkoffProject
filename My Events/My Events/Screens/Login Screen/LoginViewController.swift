import UIKit
import Combine

protocol LoginViewControllerDelegate: AnyObject {
    func goToSignUp()
    func loginUser()
}

class LoginViewController: UIViewController {

    private let contentView: LoginView = .init()
    private let viewModel: LoginViewModel

    private var cancellable: AnyCancellable?

    weak var delegate: LoginViewControllerDelegate?

    init(viewModel: LoginViewModel) {
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

        view.backgroundColor = .systemGray6

        navigationItem.hidesBackButton = true

        contentView.signUpButtonDelegate = self
        contentView.loginButtonDelegate = self

        succesfulyEnterLogin()
    }
// из viewmodel узнаем успешно ли введены данные и авторизовываем пользователя
    func succesfulyEnterLogin() {
        cancellable = viewModel.$successfulyEnterLogin
            .sink { userSuccessfulyEnterLogin in
                if userSuccessfulyEnterLogin {
                    self.delegate?.loginUser()
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
        delegate?.goToSignUp()
    }
}

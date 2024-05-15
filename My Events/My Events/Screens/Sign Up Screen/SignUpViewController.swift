import UIKit
import Combine

class SignUpViewController: UIViewController {

    private let contentView: SignUpView = .init()
    private let viewModel: SignUpViewModel

    private var cancellable: AnyCancellable?

    weak var signUpViewControllerCoordinator: SignUpViewControllerCoordinator?

    init(viewModel: SignUpViewModel) {
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

        contentView.backLoginButtonDelegate = self
        contentView.signUpEnterButtonDelegate = self

        successfulySignUp()
    }

    func successfulySignUp() {
        cancellable = viewModel.$successfulySignUp
            .sink { bool in
                if bool {
                    self.signUpViewControllerCoordinator?.goToEventsTabBar()
                } else {
                    print("Что то пошло не так! Не удалось зарегистрироваться.")
                }
            }
    }

}
extension SignUpViewController: BackLoginButtonSignUpViewDelegate, SignUpEnterButtonSignUpViewDelegate {

    func backLoginButtonDidPressed() {
        signUpViewControllerCoordinator?.backToLoginScreen()
    }
    func signUpEnterButtonDidPressed(email: String, password: String, passwordAgain: String, userName: String) {
        viewModel.signUpUser(email: email, password: password, passwordAgain: passwordAgain, userName: userName)
    }
}

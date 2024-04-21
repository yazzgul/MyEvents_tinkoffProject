import UIKit

class SignUpViewController: UIViewController {

    private let contentView: SignUpView = .init()
    private let viewModel: SignUpModel

    weak var signUpViewControllerCoordinator: SignUpViewControllerCoordinator?

    init(viewModel: SignUpModel) {
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

        contentView.backLoginButtonDelegate = self
        navigationItem.hidesBackButton = true
    }

}
extension SignUpViewController: BackLoginButtonSignUpViewDelegate {
    func backLoginButtonDidPressed() {
        signUpViewControllerCoordinator?.backToLoginScreen()
    }
}

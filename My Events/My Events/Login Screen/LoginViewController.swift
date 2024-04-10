import UIKit

class LoginViewController: UIViewController {

    private let contentView: LoginView = .init()

    override func loadView() {
        view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        contentView.signUpButtonDelegate = self
        navigationItem.hidesBackButton = true
    }

}
extension LoginViewController: SignUpButtonLoginViewDelegate {
    func signUpButtonDidPressed() {
//        let signUpModel = SignUpModel()
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
}

import UIKit

class SignUpViewController: UIViewController {

    private let contentView: SignUpView = .init()

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
        navigationController?.popViewController(animated: true)
    }
}

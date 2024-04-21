import UIKit
import SnapKit

class StartViewController: UIViewController {

    private var contentView: StartView = .init()

    override func loadView() {
        view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        contentView.delegate = self
    }

}
extension StartViewController: NextScreenStartViewDelegate {
    func nextScreenButtonDidPressed() {
        let loginModel = LoginModel()
        let loginVC = LoginViewController(viewModel: loginModel)
        navigationController?.pushViewController(loginVC, animated: true)
    }
}

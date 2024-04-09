import UIKit
import SnapKit

class StartViewController: UIViewController {

    private var contentView: StartView = .init()
    private var coordinator: Coordinator?

    override func loadView() {
        view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        contentView.delegate = self
        coordinator = Coordinator(navigationController: navigationController ?? UINavigationController())
    }

}
extension StartViewController: NextScreenStartViewDelegate {
    func nextScreenButtonDidPressed() {
        coordinator?.goToLoginScreen()
    }
}

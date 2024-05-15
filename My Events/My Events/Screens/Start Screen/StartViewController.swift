import UIKit
import SnapKit

protocol StartViewControllerDelegate: AnyObject {
    func goToLoginScreen()
}

class StartViewController: UIViewController {

    private var contentView: StartView = .init()

//    weak var startViewControllerCoordinator: StartViewControllerCoordinator?
    weak var delegate: StartViewControllerDelegate?

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
        delegate?.goToLoginScreen()
    }
}

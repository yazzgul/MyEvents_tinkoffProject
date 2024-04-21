import UIKit
import SnapKit

class StartViewController: UIViewController {

    private var contentView: StartView = .init()

    weak var startViewControllerCoordinator: StartViewControllerCoordinator?

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
        startViewControllerCoordinator?.goToLoginScreen()
    }
}

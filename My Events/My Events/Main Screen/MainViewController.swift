import UIKit

class MainViewController: UIViewController {

    private let contentView: MainView = .init()

    override func loadView() {
        view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }
    
}

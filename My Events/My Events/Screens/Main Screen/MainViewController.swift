import UIKit

class MainViewController: UIViewController {

    private let contentView: MainView = .init()
    private let viewModel: MainViewModel

    weak var mainViewControllerCoordinator: MainViewControllerCoordinator?

    init(viewModel: MainViewModel) {
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
    }
    
}

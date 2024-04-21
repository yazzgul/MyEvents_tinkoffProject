import UIKit

class MainViewController: UIViewController {

    private let contentView: MainView = .init()
    private let viewModel: MainModel

    init(viewModel: MainModel) {
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

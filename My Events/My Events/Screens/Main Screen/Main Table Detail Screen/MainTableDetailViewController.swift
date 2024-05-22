import UIKit
import Combine

protocol MainTableDetailViewControllerDelegate: AnyObject {
    func goToBackToTable()
}

class MainTableDetailViewController: UIViewController {
    private let contentView: MainTableDetailView = .init()
    private let viewModel: MainTableDetailViewModel

    private var cancellables = Set<AnyCancellable>()

    weak var delegate: MainTableDetailViewControllerDelegate?

    init(viewModel: MainTableDetailViewModel) {
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

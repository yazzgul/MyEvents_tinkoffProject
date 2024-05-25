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

        view.backgroundColor = .systemGray6

        contentView.delegate = self

        setupNavigationBar()

        setupEventInfo()

    }

}
extension MainTableDetailViewController {
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = contentView.backBarButtonItem
    }
}
extension MainTableDetailViewController {
    func setupEventInfo() {

        if let event = viewModel.fetchSelectedEvent() {
            contentView.configureDetail(by: event)
        }

        viewModel.fetchSelectedEventImage { [weak self] image in
            if let fetchImage = image {
                self?.contentView.configureDetail(by: fetchImage)
            } else {
                if let noImage = UIImage(named: "no_photo") {
                    self?.contentView.configureDetail(by: noImage)
                }
            }
        }

    }

}
extension MainTableDetailViewController: MainTableDetailViewDelegate {
    func backBarButtonItemDidPressed() {
        delegate?.goToBackToTable()
    }
}

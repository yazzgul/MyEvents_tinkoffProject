import UIKit
import Combine

protocol MainViewControllerDelegate: AnyObject {
    func goToTableDetailScreen()
}

class MainViewController: UIViewController {

    private let contentView: MainView = .init()
    private let viewModel: MainViewModel

    private var cancellables = Set<AnyCancellable>()

    weak var delegate: MainViewControllerDelegate?

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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        viewModel.getAllEvents()
//        viewModel.getEventDetailById(byId: 201777)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6

        contentView.setupDataSource(self)
        contentView.setupDelegate(self)

        checkingEventsEmpty()
        setupEvents()

    }
    
}
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.configureCell(tableView, cellForRowAt: indexPath)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.saveCurrentMainTableSelectedEventInEventService(tableView, didSelectRowAt: indexPath)
        delegate?.goToTableDetailScreen()
    }

}
extension MainViewController {
    func setupEvents() {
        EventService.shared.$events
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.contentView.reloadData()
            }
            .store(in: &cancellables)
    }
    func checkingEventsEmpty() {
        viewModel.$eventsAreEmpty
            .receive(on: DispatchQueue.main)
            .sink { [weak self] areEmpty in
                if areEmpty {
                    self?.contentView.startAnimatingActivityIndicator()
                } else {
                    self?.contentView.stopAnimatingActivityIndicator()
                }
            }
            .store(in: &cancellables)
    }

}

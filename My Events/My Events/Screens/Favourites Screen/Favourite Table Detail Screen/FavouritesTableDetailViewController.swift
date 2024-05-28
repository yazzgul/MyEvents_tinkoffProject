import UIKit
import Combine

protocol FavouritesTableDetailViewControllerDelegate: AnyObject {
    func goBackToTableScreen()
}

class FavouritesTableDetailViewController: UIViewController {

    private let contentView: FavouritesTableDetailView = .init()
    private let viewModel: FavouritesTableDetailViewModel

    private var cancellables = Set<AnyCancellable>()

    weak var delegate: FavouritesTableDetailViewControllerDelegate?

    init(viewModel: FavouritesTableDetailViewModel) {
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

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6

        contentView.delegate = self

        setupNavigationBar()
        setupEventInfo()
    }
    
}
extension FavouritesTableDetailViewController {
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = contentView.backBarButtonItem
    }
}
extension FavouritesTableDetailViewController {
    func setupEventInfo() {

        if let event = viewModel.fetchSelectedEvent() {
            contentView.configureDetail(by: event)

            let bookmarkImageName = viewModel.getBookmarkImageNameBySelectedEventBeforeAnimation(selectedEvent: event)
            contentView.configureBookmarkImage(with: bookmarkImageName)
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
extension FavouritesTableDetailViewController: FavouritesTableDetailViewDelegate {
    func backBarButtonItemDidPressed() {
        delegate?.goBackToTableScreen()
    }
    
    func bookmarkDidPressed() {
        if let event = viewModel.fetchSelectedEvent() {

            if viewModel.isEventFavourite(selectedEvent: event) {
                contentView.animateBookmarkChange(imageName: "bookmark") { [weak self] in
                    self?.viewModel.deleteFavouriteEvent(with: event)
                }
            } else {
                contentView.animateBookmarkChange(imageName: "bookmark-black") { [weak self] in
                    self?.viewModel.saveFavoriteEvent(with: event)
                }
                print("ANIMATED!!!!")
            }
        }
    }

}

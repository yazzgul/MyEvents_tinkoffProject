import UIKit

class FavouritesViewController: UIViewController {

    private let contentView: FavouritesView = .init()
    private let viewModel: FavouritesModel

    init(viewModel: FavouritesModel) {
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
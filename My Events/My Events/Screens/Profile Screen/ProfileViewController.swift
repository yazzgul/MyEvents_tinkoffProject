import UIKit

class ProfileViewController: UIViewController {

    private let contentView: ProfileView = .init()
    private let viewModel: ProfileModel

    weak var profileViewControllerCoordinator: ProfileViewControllerCoordinator?

    init(viewModel: ProfileModel) {
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

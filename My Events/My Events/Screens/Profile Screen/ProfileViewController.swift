import UIKit
import Combine

protocol ProfileViewControllerDelegate: AnyObject {
    func signOut()
    func goToFavouriteTableScreen()
}

class ProfileViewController: UIViewController {

    private let contentView: ProfileView = .init()
    private let viewModel: ProfileViewModel

    private var cancellables = Set<AnyCancellable>()

    weak var delegate: ProfileViewControllerDelegate?


    init(viewModel: ProfileViewModel) {
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

        setupUserProfile()
    }
    
}
extension ProfileViewController {
    func setupUserProfile() {
        if let firstName = viewModel.getUserFirstName(), let lastName = viewModel.getUserLastName() {
            contentView.configureProfileInfo(firstName: firstName, lastName: lastName)
        }
    }
}
extension ProfileViewController: ProfileViewDelegate {
    func editProfileButtonDidPressed() {
        
    }
    
    func favouriteButtonDidPressed() {
        delegate?.goToFavouriteTableScreen()
    }
    
    func signOutButtonDidPressed() {
        delegate?.signOut()
        viewModel.signOutFromProfile()
    }
}

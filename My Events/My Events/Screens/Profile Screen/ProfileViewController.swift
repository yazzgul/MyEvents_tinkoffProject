import UIKit
import Combine

protocol ProfileViewControllerDelegate: AnyObject {
    func signOut()
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
        viewModel.getProfile()

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6

        contentView.signOutButtonDelegate = self

        setupUserProfile()
    }
    
}
extension ProfileViewController {
    func setupUserProfile() {
        viewModel.$currentUser
            .receive(on: DispatchQueue.main)
            .sink { [weak self] currentUser in
                if let firstName = currentUser?.firstName, let lastName = currentUser?.lastName {
                    self?.contentView.configureProfileInfo(firstName: firstName, lastName: lastName)
                }
            }
            .store(in: &cancellables)
    }
}
extension ProfileViewController: SignOutButtonProfileViewDelegate {
    func signOutButtonDidPressed() {
        delegate?.signOut()
        viewModel.signOutFromProfile()
    }
}

import UIKit

protocol ProfileViewControllerDelegate: AnyObject {
    func signOut()
}

class ProfileViewController: UIViewController {

    private let contentView: ProfileView = .init()
    private let viewModel: ProfileViewModel

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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6

        contentView.signOutButtonDelegate = self

    }
    
}
extension ProfileViewController: SignOutButtonProfileViewDelegate {
    func signOutButtonDidPressed() {
        delegate?.signOut()
    }
}

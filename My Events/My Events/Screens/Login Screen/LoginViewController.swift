import UIKit

class LoginViewController: UIViewController {

    private let contentView: LoginView = .init()
    private let viewModel: LoginModel

    init(viewModel: LoginModel) {
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

        navigationItem.hidesBackButton = true

        contentView.signUpButtonDelegate = self
        contentView.loginButtonDelegate = self
    }

}
extension LoginViewController: SignUpButtonLoginViewDelegate, LoginButtonLoginViewDelegate {

    func loginButtonDidPressed() {
        let tabBarController = EventsTabBarController()

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = tabBarController
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }

    func signUpButtonDidPressed() {
        let signUpModel = SignUpModel()
        let signUpVC = SignUpViewController(viewModel: signUpModel)
        navigationController?.pushViewController(signUpVC, animated: true)
    }
}

import UIKit
import SnapKit

protocol SignUpButtonLoginViewDelegate: AnyObject {
    func signUpButtonDidPressed()
}
protocol LoginButtonLoginViewDelegate: AnyObject {
    func loginButtonDidPressed(email: String, password: String)
}

class LoginView: UIView {
    
    private lazy var appNameLabel: UILabel = UILabel()
    private lazy var welcomeLabel: UILabel = UILabel()
    private lazy var captionLabel: UILabel = UILabel()
    private lazy var haveAccountLabel: UILabel = UILabel()

    private lazy var ballonImageView: UIImageView = UIImageView()

    private lazy var emailTextField: UITextField = UITextField()
    private lazy var passwordTextField: UITextField = UITextField()

    private lazy var loginEnterButton: UIButton = UIButton()
    private lazy var signUpButton: UIButton = UIButton()

    weak var signUpButtonDelegate: SignUpButtonLoginViewDelegate?
    weak var loginButtonDelegate: LoginButtonLoginViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFunc()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupFunc() {
        setupBalloonImageView()
        setupAppNameLabel()
        setupWelcomeLabel()
        setupCaptionLabel()
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginEnterButton()
        setupHaveAccountLabel()
        setupSignUpButton()
    }

    func setupBalloonImageView() {
        addSubview(ballonImageView)

        ballonImageView.image = UIImage(named: "ballon_pink_clean")
        ballonImageView.contentMode = .scaleToFill

        ballonImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-80)
            make.top.equalToSuperview().inset(100)
            make.width.equalTo(160)
            make.height.equalTo(170)
        }
    }
    func setupAppNameLabel() {
        addSubview(appNameLabel)

        appNameLabel.text = "MY EVENTS"
        appNameLabel.numberOfLines = .zero
        appNameLabel.font = .systemFont(ofSize: 23, weight: .heavy, width: .condensed)
        appNameLabel.textColor = UIColor.vividPinkColor()
        appNameLabel.textAlignment = .center

        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(ballonImageView.snp.bottom).offset(7)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
    }
    func setupWelcomeLabel() {
        addSubview(welcomeLabel)

        welcomeLabel.text = "Welcome Back!"
        welcomeLabel.numberOfLines = 1
        welcomeLabel.font = .systemFont(ofSize: 25, weight: .bold)
        welcomeLabel.textColor = .black
        welcomeLabel.textAlignment = .center

        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(20)
        }
    }
    func setupCaptionLabel() {
        addSubview(captionLabel)

        captionLabel.text = "Use Credentials to access your account"
        captionLabel.numberOfLines = 1
        captionLabel.font = .systemFont(ofSize: 15, weight: .medium)
        captionLabel.textColor = .systemGray2
        captionLabel.textAlignment = .center

        captionLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(15)
        }
    }
    func setupHaveAccountLabel() {
        addSubview(haveAccountLabel)

        haveAccountLabel.text = "Don`t have an account?"
        haveAccountLabel.numberOfLines = 1
        haveAccountLabel.font = .systemFont(ofSize: 15, weight: .medium)
        haveAccountLabel.textColor = .black
        haveAccountLabel.textAlignment = .center

        haveAccountLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.leading.equalToSuperview().offset(75)
            make.width.equalTo(170)
            make.height.equalTo(15)
        }
    }
    func setupEmailTextField() {
        addSubview(emailTextField)

        emailTextField.placeholder = "Enter Email"
        emailTextField.backgroundColor = .white
        emailTextField.textColor = .systemGray
        emailTextField.borderStyle = .roundedRect
        emailTextField.font = .systemFont(ofSize: 13, weight: .medium)
        emailTextField.autocapitalizationType = .none

        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(captionLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
    }
    func setupPasswordTextField() {
        addSubview(passwordTextField)

        passwordTextField.placeholder = "Enter Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.textColor = .black
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.font = .systemFont(ofSize: 13, weight: .medium)
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
    }
    func setupLoginEnterButton() {
        addSubview(loginEnterButton)

        loginEnterButton.setTitle("Login", for: .normal)
        loginEnterButton.layer.cornerRadius = 20
        loginEnterButton.clipsToBounds = true
        loginEnterButton.backgroundColor = UIColor.vividPinkColor()
        loginEnterButton.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
            if let email = self?.emailTextField.text, let password = self?.passwordTextField.text {
                self?.loginButtonDelegate?.loginButtonDidPressed(email: email, password: password)
            }
        }

        loginEnterButton.addAction(action, for: .touchUpInside)

        loginEnterButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(29)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
    }
    func setupSignUpButton() {
        addSubview(signUpButton)

        signUpButton.backgroundColor = .clear
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(UIColor.vividPinkColor(), for: .normal)
        signUpButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)

        let action = UIAction { [weak self] _ in
            self?.signUpButtonDelegate?.signUpButtonDidPressed()

        }
        signUpButton.addAction(action, for: .touchUpInside)

        signUpButton.snp.makeConstraints { make in
            make.centerY.equalTo(haveAccountLabel.snp.centerY)
            make.leading.equalTo(haveAccountLabel.snp.trailing).offset(3)
            make.width.equalTo(65)
            make.height.equalTo(15)
        }
    }

}

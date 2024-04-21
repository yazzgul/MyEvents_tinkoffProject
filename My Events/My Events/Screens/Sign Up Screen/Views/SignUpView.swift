import UIKit
import SnapKit

protocol BackLoginButtonSignUpViewDelegate: AnyObject {
    func backLoginButtonDidPressed()
}
protocol SignUpEnterButtonSignUpViewDelegate: AnyObject {
    func signUpEnterButtonDidPressed(email: String, password: String, passwordAgain: String, userName: String)
}

class SignUpView: UIView {

    private lazy var appNameLabel: UILabel = UILabel()
    private lazy var createAccountLabel: UILabel = UILabel()
    private lazy var captionLabel: UILabel = UILabel()
    private lazy var haveAccountLabel: UILabel = UILabel()

    private lazy var ballonImageView: UIImageView = UIImageView()

    private lazy var userNameTextField: UITextField = UITextField()
    private lazy var emailTextField: UITextField = UITextField()
    private lazy var passwordTextField: UITextField = UITextField()
    private lazy var passwordCheckTextField: UITextField = UITextField()

    private lazy var signUpEnterButton: UIButton = UIButton()
    private lazy var backLoginButton: UIButton = UIButton()

    weak var backLoginButtonDelegate: BackLoginButtonSignUpViewDelegate?
    weak var signUpEnterButtonDelegate: SignUpEnterButtonSignUpViewDelegate?

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
        setupCreateAccountLabel()
        setupCaptionLabel()
        setupUserNameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupPasswordCheckTextField()
        setupSignUpEnterButton()
        setupHaveAccountLabel()
        setupBackLoginButton()
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
    func setupCreateAccountLabel() {
        addSubview(createAccountLabel)

        createAccountLabel.text = "Create an Account"
        createAccountLabel.numberOfLines = 1
        createAccountLabel.font = .systemFont(ofSize: 25, weight: .bold)
        createAccountLabel.textColor = .black
        createAccountLabel.textAlignment = .center

        createAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(20)
        }
    }
    func setupCaptionLabel() {
        addSubview(captionLabel)

        captionLabel.text = "Please fill this detail to create an account"
        captionLabel.numberOfLines = 1
        captionLabel.font = .systemFont(ofSize: 15, weight: .medium)
        captionLabel.textColor = .systemGray2
        captionLabel.textAlignment = .center

        captionLabel.snp.makeConstraints { make in
            make.top.equalTo(createAccountLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(15)
        }
    }
    func setupHaveAccountLabel() {
        addSubview(haveAccountLabel)

        haveAccountLabel.text = "Already have an account?"
        haveAccountLabel.numberOfLines = 1
        haveAccountLabel.font = .systemFont(ofSize: 15, weight: .medium)
        haveAccountLabel.textColor = .black
        haveAccountLabel.textAlignment = .center

        haveAccountLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.leading.equalToSuperview().offset(75)
            make.width.equalTo(180)
            make.height.equalTo(15)
        }
    }
    func setupUserNameTextField() {
        addSubview(userNameTextField)

        userNameTextField.placeholder = "Enter Your Name"
        userNameTextField.backgroundColor = .white
        userNameTextField.textColor = .systemGray
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.font = .systemFont(ofSize: 13, weight: .medium)
        userNameTextField.autocapitalizationType = .none

        userNameTextField.snp.makeConstraints { make in
            make.top.equalTo(captionLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
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
            make.top.equalTo(userNameTextField.snp.bottom).offset(15)
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
    func setupPasswordCheckTextField() {
        addSubview(passwordCheckTextField)

        passwordCheckTextField.placeholder = "Enter Password Again"
        passwordCheckTextField.backgroundColor = .white
        passwordCheckTextField.textColor = .black
        passwordCheckTextField.borderStyle = .roundedRect
        passwordCheckTextField.font = .systemFont(ofSize: 13, weight: .medium)
        passwordCheckTextField.autocapitalizationType = .none
        passwordCheckTextField.isSecureTextEntry = true

        passwordCheckTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
    }
    func setupSignUpEnterButton() {
        addSubview(signUpEnterButton)

        signUpEnterButton.setTitle("Sign Up", for: .normal)
        signUpEnterButton.layer.cornerRadius = 20
        signUpEnterButton.clipsToBounds = true
        signUpEnterButton.backgroundColor = UIColor.vividPinkColor()
        signUpEnterButton.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
            if let email = self?.emailTextField.text, let password = self?.passwordTextField.text, let passwordCheck = self?.passwordCheckTextField.text, let userName = self?.userNameTextField.text {
                self?.signUpEnterButtonDelegate?.signUpEnterButtonDidPressed(email: email, password: password, passwordAgain: passwordCheck, userName: userName)
            }
        }
        signUpEnterButton.addAction(action, for: .touchUpInside)

        signUpEnterButton.snp.makeConstraints { make in
            make.top.equalTo(passwordCheckTextField.snp.bottom).offset(29)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
    }
    func setupBackLoginButton() {
        addSubview(backLoginButton)

        backLoginButton.backgroundColor = .clear
        backLoginButton.setTitle("Login", for: .normal)
        backLoginButton.setTitleColor(UIColor.vividPinkColor(), for: .normal)
        backLoginButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)

        let action = UIAction { [weak self] _ in
            self?.backLoginButtonDelegate?.backLoginButtonDidPressed()
        }
        backLoginButton.addAction(action, for: .touchUpInside)

        backLoginButton.snp.makeConstraints { make in
            make.centerY.equalTo(haveAccountLabel.snp.centerY)
            make.leading.equalTo(haveAccountLabel.snp.trailing).offset(2)
            make.width.equalTo(52)
            make.height.equalTo(15)
        }
    }
}

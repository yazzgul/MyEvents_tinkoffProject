import UIKit
import SnapKit

protocol BackLoginButtonSignUpViewDelegate: AnyObject {
    func backLoginButtonDidPressed()
}
protocol SignUpEnterButtonSignUpViewDelegate: AnyObject {
    func signUpEnterButtonDidPressed(email: String, password: String, passwordAgain: String, userName: String)
}

class SignUpView: UIView {

    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "MY EVENTS"
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 23, weight: .heavy, width: .condensed)
        label.textColor = UIColor.vividPinkColor()
        label.textAlignment = .center
        return label
    }()
    private lazy var createAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Create an Account"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    private lazy var captionLabel: UILabel = {
        let label = UILabel()
        label.text = "Please fill this detail to create an account"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .systemGray2
        label.textAlignment = .center
        return label
    }()
    private lazy var haveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private lazy var ballonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ballon_pink_clean")
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    private lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Your Name (e.g. Kendall Jenner)"
        textField.backgroundColor = .white
        textField.textColor = .systemGray
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 13, weight: .medium)
        textField.autocapitalizationType = .none
        return textField
    }()
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Email"
        textField.backgroundColor = .white
        textField.textColor = .systemGray
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 13, weight: .medium)
        textField.autocapitalizationType = .none
        return textField
    }()
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password"
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 13, weight: .medium)
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField

    }()
    private lazy var passwordCheckTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password Again"
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 13, weight: .medium)
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()

    private lazy var signUpEnterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = UIColor.vividPinkColor()
        button.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
            if let email = self?.emailTextField.text,
               let password = self?.passwordTextField.text,
               let passwordCheck = self?.passwordCheckTextField.text,
               let userName = self?.userNameTextField.text {
                self?.signUpEnterButtonDelegate?.signUpEnterButtonDidPressed(email: email,
                                                                             password: password,
                                                                             passwordAgain: passwordCheck,
                                                                             userName: userName)
            }
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    private lazy var backLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.vividPinkColor(), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)

        let action = UIAction { [weak self] _ in
            self?.backLoginButtonDelegate?.backLoginButtonDidPressed()
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()

    weak var backLoginButtonDelegate: BackLoginButtonSignUpViewDelegate?
    weak var signUpEnterButtonDelegate: SignUpEnterButtonSignUpViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension SignUpView {
    func configureView() {
        addSubview(ballonImageView)
        addSubview(appNameLabel)
        addSubview(createAccountLabel)
        addSubview(captionLabel)
        addSubview(haveAccountLabel)
        addSubview(userNameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(passwordCheckTextField)
        addSubview(signUpEnterButton)
        addSubview(backLoginButton)

        ballonImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-80)
            make.top.equalToSuperview().inset(100)
            make.width.equalTo(160)
            make.height.equalTo(170)
        }
        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(ballonImageView.snp.bottom).offset(7)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
        createAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(20)
        }
        captionLabel.snp.makeConstraints { make in
            make.top.equalTo(createAccountLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(15)
        }
        haveAccountLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.leading.equalToSuperview().offset(75)
            make.width.equalTo(180)
            make.height.equalTo(15)
        }
        userNameTextField.snp.makeConstraints { make in
            make.top.equalTo(captionLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameTextField.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        passwordCheckTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        signUpEnterButton.snp.makeConstraints { make in
            make.top.equalTo(passwordCheckTextField.snp.bottom).offset(29)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        backLoginButton.snp.makeConstraints { make in
            make.centerY.equalTo(haveAccountLabel.snp.centerY)
            make.leading.equalTo(haveAccountLabel.snp.trailing).offset(2)
            make.width.equalTo(52)
            make.height.equalTo(15)
        }
    }

}

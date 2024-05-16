import UIKit
import SnapKit

protocol SignOutButtonProfileViewDelegate: AnyObject {
    func signOutButtonDidPressed()
}

class ProfileView: UIView {
    private lazy var pageNameLabel: UILabel = {
        let label = UILabel()
        label.text = "My profile"
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 18, weight: .heavy, width: .condensed)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    private lazy var userFirstnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Cat"
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 21, weight: .heavy, width: .condensed)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    private lazy var userSurnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Catov"
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 21, weight: .heavy, width: .condensed)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "demoCat")
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 80
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var favouriteButton: UIButton = {
        let button = UIButton()
        button.setTitle("My Favourites", for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = UIColor.vividPinkColor()
        button.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
        }
        button.addAction(action, for: .touchUpInside)

        return button
    }()
    private lazy var commentsButton: UIButton = {
        let button = UIButton()
        button.setTitle("My Comments", for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = UIColor.vividPinkColor()
        button.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
        }
        button.addAction(action, for: .touchUpInside)

        return button
    }()
    private lazy var editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = UIColor.vividPinkColor()
        button.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
        }
        button.addAction(action, for: .touchUpInside)

        return button
    }()
    private lazy var signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Out", for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = UIColor.vividPinkColor()
        button.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
            self?.signOutButtonDelegate?.signOutButtonDidPressed()
        }
        button.addAction(action, for: .touchUpInside)

        return button
    }()

    weak var signOutButtonDelegate: SignOutButtonProfileViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension ProfileView {
    func configureView() {

        let stackView = UIStackView(arrangedSubviews: [userFirstnameLabel, userSurnameLabel])
        stackView.axis = .horizontal
        stackView.spacing = 1

        addSubview(pageNameLabel)
        addSubview(avatarImageView)
        addSubview(stackView)
        addSubview(favouriteButton)
        addSubview(commentsButton)
        addSubview(editProfileButton)
        addSubview(signOutButton)

        pageNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(72)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(24)
        }
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(pageNameLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(160)
            make.height.equalTo(160)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        favouriteButton.snp.makeConstraints { make in
            make.top.equalTo(userFirstnameLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        commentsButton.snp.makeConstraints { make in
            make.top.equalTo(favouriteButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        editProfileButton.snp.makeConstraints { make in
            make.top.equalTo(commentsButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        signOutButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
    }

}

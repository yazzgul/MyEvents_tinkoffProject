import UIKit
import SnapKit

class ProfileView: UIView {

    private lazy var pageNameLabel: UILabel = UILabel()
    private lazy var userFirstnameLabel: UILabel = UILabel()
    private lazy var userSurnameLabel: UILabel = UILabel()

    private lazy var avatarImageView: UIImageView = UIImageView()

    private lazy var favouriteButton: UIButton = UIButton()
    private lazy var commentsButton: UIButton = UIButton()
    private lazy var editProfileButton: UIButton = UIButton()
    private lazy var signOutButton: UIButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFunc()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupFunc() {
        setupPageNameLabel()
        setupAvatarImageView()
        setupUserNameLabel()

        setupFavouriteButton()
        setupCommentsButton()
        setupEditProfileButton()
        setupSignOutButton()
    }

    func setupPageNameLabel() {
        addSubview(pageNameLabel)

        pageNameLabel.text = "My profile"
        pageNameLabel.numberOfLines = .zero
        pageNameLabel.font = .systemFont(ofSize: 18, weight: .heavy, width: .condensed)
        pageNameLabel.textColor = .black
        pageNameLabel.textAlignment = .center

        pageNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(75)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(20)
        }
    }
    func setupAvatarImageView() {
        addSubview(avatarImageView)

        avatarImageView.image = UIImage(named: "demoCat")
        avatarImageView.contentMode = .scaleToFill
        avatarImageView.layer.cornerRadius = 80
        avatarImageView.clipsToBounds = true

        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(pageNameLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(160)
            make.height.equalTo(160)
        }
    }
    func setupUserNameLabel() {
        userFirstnameLabel.text = "Cat"
        userFirstnameLabel.numberOfLines = .zero
        userFirstnameLabel.font = .systemFont(ofSize: 21, weight: .heavy, width: .condensed)
        userFirstnameLabel.textColor = .black
        userFirstnameLabel.textAlignment = .center

        userSurnameLabel.text = "Catov"
        userSurnameLabel.numberOfLines = .zero
        userSurnameLabel.font = .systemFont(ofSize: 21, weight: .heavy, width: .condensed)
        userSurnameLabel.textColor = .black
        userSurnameLabel.textAlignment = .center

        let stackView = UIStackView(arrangedSubviews: [userFirstnameLabel, userSurnameLabel])
        stackView.axis = .horizontal
        stackView.spacing = 1

        addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    func setupFavouriteButton() {
        addSubview(favouriteButton)

        favouriteButton.setTitle("My Favourites", for: .normal)
        favouriteButton.layer.cornerRadius = 20
        favouriteButton.clipsToBounds = true
        favouriteButton.backgroundColor = UIColor.vividPinkColor()
        favouriteButton.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
        }
        favouriteButton.addAction(action, for: .touchUpInside)

        favouriteButton.snp.makeConstraints { make in
            make.top.equalTo(userFirstnameLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
    }
    func setupCommentsButton() {
        addSubview(commentsButton)

        commentsButton.setTitle("My Comments", for: .normal)
        commentsButton.layer.cornerRadius = 20
        commentsButton.clipsToBounds = true
        commentsButton.backgroundColor = UIColor.vividPinkColor()
        commentsButton.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
        }
        commentsButton.addAction(action, for: .touchUpInside)

        commentsButton.snp.makeConstraints { make in
            make.top.equalTo(favouriteButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }

    }
    func setupEditProfileButton() {
        addSubview(editProfileButton)

        editProfileButton.setTitle("Edit Profile", for: .normal)
        editProfileButton.layer.cornerRadius = 20
        editProfileButton.clipsToBounds = true
        editProfileButton.backgroundColor = UIColor.vividPinkColor()
        editProfileButton.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
        }
        editProfileButton.addAction(action, for: .touchUpInside)

        editProfileButton.snp.makeConstraints { make in
            make.top.equalTo(commentsButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }

    }
    func setupSignOutButton() {
        addSubview(signOutButton)

        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.layer.cornerRadius = 20
        signOutButton.clipsToBounds = true
        signOutButton.backgroundColor = UIColor.vividPinkColor()
        signOutButton.setTitleColor(.white, for: .normal)

        let action = UIAction { [weak self] _ in
        }
        signOutButton.addAction(action, for: .touchUpInside)

        signOutButton.snp.makeConstraints { make in
//            make.top.equalTo(editProfileButton.snp.bottom).offset(15)
            make.bottom.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }

    }
}

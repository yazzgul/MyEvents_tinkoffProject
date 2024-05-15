import UIKit
import SnapKit

protocol NextScreenStartViewDelegate: AnyObject {
    func nextScreenButtonDidPressed()
}
class StartView: UIView {

    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "MY EVENTS"
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 50, weight: .heavy, width: .condensed)
        label.textColor = UIColor.vividPinkColor()
        label.textAlignment = .center
        return label
    }()
    private lazy var captionLabel: UILabel = {
        let label = UILabel()
        label.text = "Find your favourite events here..."
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        label.textAlignment = .justified
        return label
    }()
    private lazy var ballonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ballon_pink_clean")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = UIColor.vividPinkColor()
        button.setTitleColor(.white, for: .highlighted)

        let action = UIAction { [weak self] _ in
            self?.delegate?.nextScreenButtonDidPressed()

        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()

    weak var delegate: NextScreenStartViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension StartView {
    func configureView() {
        addSubview(ballonImageView)
        addSubview(appNameLabel)
        addSubview(captionLabel)
        addSubview(nextButton)

        ballonImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-5)
            make.top.equalToSuperview().inset(100)
            make.width.equalTo(280)
            make.height.equalTo(300)
        }
        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(ballonImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(400)
            make.height.equalTo(40)
        }
        captionLabel.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(400)
            make.height.equalTo(35)
        }
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
    }

}

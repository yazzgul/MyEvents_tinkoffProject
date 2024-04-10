import UIKit
import SnapKit

protocol NextScreenStartViewDelegate: AnyObject {
    func nextScreenButtonDidPressed()
}
class StartView: UIView {

    private lazy var appNameLabel: UILabel = UILabel()
    private lazy var captionLabel: UILabel = UILabel()
    private lazy var ballonImageView: UIImageView = UIImageView()
    private lazy var nextButton: UIButton = UIButton()

    weak var delegate: NextScreenStartViewDelegate?

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
        setupCaptionLabel()
        setupNextButton()
    }

    func setupBalloonImageView() {
        addSubview(ballonImageView)

        ballonImageView.image = UIImage(named: "ballon_pink_clean")
        ballonImageView.contentMode = .scaleToFill

        ballonImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-5)
            make.top.equalToSuperview().inset(100)
            make.width.equalTo(280)
            make.height.equalTo(300)
        }
    }
    func setupAppNameLabel() {
        addSubview(appNameLabel)

        appNameLabel.text = "MY EVENTS"
        appNameLabel.numberOfLines = .zero
        appNameLabel.font = .systemFont(ofSize: 50, weight: .heavy, width: .condensed)
        appNameLabel.textColor = UIColor.vividPinkColor()
        appNameLabel.textAlignment = .center

        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(ballonImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(400)
            make.height.equalTo(40)
        }
    }
    func setupCaptionLabel() {
        addSubview(captionLabel)

        captionLabel.text = "Find your favourite events here..."
        captionLabel.numberOfLines = .zero
        captionLabel.font = .systemFont(ofSize: 17, weight: .regular)
        captionLabel.textColor = .black
        captionLabel.textAlignment = .justified

        captionLabel.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(400)
            make.height.equalTo(35)
        }
    }
    func setupNextButton() {
        addSubview(nextButton)

        nextButton.setTitle("Next", for: .normal)
        nextButton.layer.cornerRadius = 20
        nextButton.clipsToBounds = true
        nextButton.backgroundColor = UIColor.vividPinkColor()
        nextButton.setTitleColor(.white, for: .highlighted)

        let action = UIAction { [weak self] _ in
            self?.delegate?.nextScreenButtonDidPressed()

        }
        nextButton.addAction(action, for: .touchUpInside)

        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
    }
    
}

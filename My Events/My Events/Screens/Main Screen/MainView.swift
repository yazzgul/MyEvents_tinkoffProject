import UIKit

class MainView: UIView {
    private lazy var pageNameLabel: UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFunc()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupFunc() {
        setupPageNameLabel()
    }

    func setupPageNameLabel() {
        addSubview(pageNameLabel)

        pageNameLabel.text = "Main page"
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

}

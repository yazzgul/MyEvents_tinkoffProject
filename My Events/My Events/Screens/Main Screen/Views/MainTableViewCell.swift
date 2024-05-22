import UIKit

class MainTableViewCell: UITableViewCell {
    private lazy var eventImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    private lazy var eventNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 3
        return label
    }()
//    private lazy var stackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [eventImageView, eventNameLabel])
//        stackView.axis = .horizontal
//        stackView.spacing = 5
//        return stackView
//    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
extension MainTableViewCell {
    func configureView() {
        contentView.backgroundColor = .white

        contentView.addSubview(eventImageView)
        contentView.addSubview(eventNameLabel)

        eventImageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(10)
            make.size.equalTo(CGSize(width: 60, height: 80))
        }
        eventNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalTo(eventImageView.snp.trailing).inset(20)
            make.size.equalTo(CGSize(width: 240, height: 40))
        }
    }
}
extension MainTableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    func configureCell(with event: Event) {
//        if let images = event.images {
//            eventImageView.image = images.first
//        }
//        eventImageView.image = image
        if let shortTitle = event.shortTitle {
            eventNameLabel.text = shortTitle
        }
        else {
            eventNameLabel.text = event.title
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        eventImageView.image = nil
        eventNameLabel.text = nil
    }

}

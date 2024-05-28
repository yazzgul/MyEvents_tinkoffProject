import UIKit

class MainTableViewCell: UITableViewCell {
    private lazy var eventImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    private lazy var eventNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold, width: .condensed)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 3
        return label
    }()
    private lazy var eventDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 11, weight: .medium, width: .condensed)
        label.textColor = .systemGray2
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()

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
        contentView.backgroundColor = .systemGray6

        contentView.addSubview(eventImageView)
        contentView.addSubview(eventNameLabel)
        contentView.addSubview(eventDescriptionLabel)

        eventImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 145, height: 100))
        }
        eventNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(eventImageView.snp.trailing).offset(16)
            make.size.equalTo(CGSize(width: 180, height: 40))
        }
        eventDescriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(eventImageView.snp.trailing).offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.size.equalTo(CGSize(width: 180, height: 40))
        }
    }
}
extension MainTableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self) + "_main"
    }

    func configureCell(with image: UIImage) {
        eventImageView.image = image
    }
    func configureCell(with event: Event) {
        eventNameLabel.text = event.title
//        у API в обьектах Event у аттрибута decription остаются префиксы, суффиксы
        var decriptionEvent = event.description
        if decriptionEvent.hasPrefix("<p>") {
            decriptionEvent.removeFirst(3)
        }
        if decriptionEvent.hasSuffix("</p>") {
            decriptionEvent.removeLast(4)
        }

        eventDescriptionLabel.text = decriptionEvent
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        eventImageView.image = nil
        eventNameLabel.text = nil
        eventDescriptionLabel.text = nil
    }

}

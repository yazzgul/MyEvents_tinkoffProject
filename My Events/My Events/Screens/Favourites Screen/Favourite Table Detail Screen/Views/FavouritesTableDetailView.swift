import UIKit

protocol FavouritesTableDetailViewDelegate: AnyObject {
    func backBarButtonItemDidPressed()
}
class FavouritesTableDetailView: UIView {
    private lazy var pageNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Event"
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 18, weight: .heavy, width: .condensed)
        label.textColor = .black
        label.backgroundColor = .systemGray6
        label.textAlignment = .center
        return label
    }()

    private lazy var backBarButtonItemAction = UIAction { [weak self] _ in
        self?.delegate?.backBarButtonItemDidPressed()
    }
    lazy var backBarButtonItem = UIBarButtonItem(title: "Back", primaryAction: self.backBarButtonItemAction)

    private lazy var eventImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    private lazy var eventNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold, width: .condensed)
        label.textColor = .black
        label.backgroundColor = .systemGray6
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
    private lazy var ageRestrictionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 11, weight: .bold, width: .condensed)
        label.textColor = .systemGray2
        label.backgroundColor = .systemGray6
        label.textAlignment = .center
        return label
    }()
    private lazy var bodyAboutLabel: UILabel = {
        let label = UILabel()
        label.text = "About"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold, width: .condensed)
        label.textColor = .black
        label.backgroundColor = .systemGray6
        label.textAlignment = .left
        return label
    }()
    private var eventBodyTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 14, weight: .medium, width: .condensed)
        textView.textColor = .systemGray2
        textView.backgroundColor = .systemGray6
        textView.isEditable = false
        textView.isScrollEnabled = true
        return textView
    }()
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold, width: .condensed)
        label.textColor = .systemGray2
        label.backgroundColor = .systemGray6
        label.textAlignment = .left
        return label
    }()
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold, width: .condensed)
        label.textColor = .systemGray2
        label.backgroundColor = .systemGray6
        label.textAlignment = .left
        return label
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold, width: .condensed)
        label.textColor = .systemGray2
        label.text = "Date: "
        label.backgroundColor = .systemGray6
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()

    weak var delegate: FavouritesTableDetailViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
extension FavouritesTableDetailView {
    func configureView() {
        addSubview(pageNameLabel)
        addSubview(eventNameLabel)
        addSubview(ageRestrictionLabel)
        addSubview(eventImageView)
        addSubview(bodyAboutLabel)
        addSubview(eventBodyTextView)
        addSubview(cityLabel)
        addSubview(priceLabel)
        addSubview(dateLabel)

        pageNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(72)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(24)
        }

        eventNameLabel.snp.makeConstraints { make in
            make.top.equalTo(pageNameLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        ageRestrictionLabel.snp.makeConstraints { make in
            make.top.equalTo(eventNameLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 60, height: 12))
        }
        eventImageView.snp.makeConstraints { make in
            make.top.equalTo(ageRestrictionLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(250)
        }
        bodyAboutLabel.snp.makeConstraints { make in
            make.top.equalTo(eventImageView.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(32)
            make.width.equalTo(48)
            make.height.equalTo(20)
        }
        eventBodyTextView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bodyAboutLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(106)
        }
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(eventBodyTextView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(20)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(20)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(24)
        }
    }

}
extension FavouritesTableDetailView {
    func configureDetail(by event: Event) {
//        перенести логику во вьюмодел
        eventNameLabel.text = event.title
        var eventText = " "

        if let textEvent = event.bodyText {
            eventText = textEvent
        } else {
            eventText = event.description
        }
        if eventText.hasPrefix("<p>") {
            eventText.removeFirst(3)
        }
        if eventText.hasSuffix("</p>") {
            eventText.removeLast(4)
        }

        eventBodyTextView.text = eventText

        if let ageRestrictionEvent = event.ageRestriction {
            ageRestrictionLabel.text = ageRestrictionEvent
        } else {
            ageRestrictionLabel.text = "+6"
        }

        if let priceEvent = event.price {
            priceLabel.text = "Price: " + priceEvent
        } else {
            priceLabel.text = "Price: No info about price"
        }

        if let cityEvent = event.location?.slug {
            cityLabel.text = "City: " + cityEvent
        } else {
            cityLabel.text = "City: No info about city"
        }

        var datesEvent: [String] = []

        if let dates = event.dates {
            for dateElement in dates {

                let sDate = dateElement.startDate ?? " "
                let eDate = dateElement.endDate ?? " "

                let fullDate = sDate + " - " + eDate

                datesEvent.append(fullDate)
            }
        }


        for fullDate in datesEvent {
            dateLabel.text = (dateLabel.text ?? "Date: ") + fullDate
        }
        if ((dateLabel.text?.isEqual("Date: ")) != nil) {
            dateLabel.text = "Date: No info about date"
        }

//        print("event: ", event.title)
//        print("event id: ", event.id)
//        print("city: ", event.location?.name)
//        print("dates: ",event.dates?.first?.startDate)
//        print("price: ", event.price)


    }

    func configureDetail(by image: UIImage) {
        eventImageView.image = image
    }
}


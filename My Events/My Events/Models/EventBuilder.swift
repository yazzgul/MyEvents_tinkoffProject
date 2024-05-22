import UIKit

class EventBuilder {
    private var id: Int?
    private var dates: [DateElement]?
    private var title: String?
    private var shortTitle: String?
    private var description: String?
    private var bodyText: String?
    private var location: Location?
    private var categories: [String]?
    private var ageRestriction: String?
    private var price: String?
    private var isFree: Bool?
    private var images: [UIImage]?

    func addId(id: Int) -> Self {
        self.id = id
        return self
    }
    func addDates(dates: [DateElement]) -> Self {
        self.dates = dates
        return self
    }

    func addTitle(title: String) -> Self {
        self.title = title
        return self
    }
    func addShortTitle(shortTitle: String) -> Self {
        self.shortTitle = shortTitle
        return self
    }
    func addDescription(description: String) -> Self {
        self.description = description
        return self
    }
    func addBodyText(bodyText: String) -> Self {
        self.bodyText = bodyText
        return self
    }
    func addLocation(location: Location) -> Self {
        self.location = location
        return self
    }
    func addCategories(categories: [String]) -> Self {
        self.categories = categories
        return self
    }
    func addAgeRestriction(ageRestriction: String) -> Self {
        self.ageRestriction = ageRestriction
        return self
    }
    func addPrice(price: String) -> Self {
        self.price = price
        return self
    }
    func addIsFree(isFree: Bool) -> Self {
        self.isFree = isFree
        return self
    }
    func addImages(images: [UIImage]) -> Self {
        self.images = images
        return self
    }

}
extension EventBuilder {
    func build() -> EventDecoded {
        let event = EventDecoded(
            id: id ?? 0,
            dates: dates,
            title: title ?? "No title",
            description: description ?? "No description",
            bodyText: bodyText,
            location: location,
            categories: categories,
            ageRestriction: ageRestriction,
            price: price,
            isFree: isFree,
            images: images,
            shortTitle: shortTitle
        )
        clearBuild()

        return event
    }

    func clearBuild() {
        id = nil
        dates = nil
        title = nil
        shortTitle = nil
        description = nil
        bodyText = nil
        location = nil
        categories = nil
        ageRestriction = nil
        price = nil
        isFree = nil
        images = nil
    }
}


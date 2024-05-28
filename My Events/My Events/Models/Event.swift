import UIKit

struct Event: Codable, Hashable, Equatable {
    let id: Int
    let dates: [DateElement]?
    let title: String
    let description: String
    let bodyText: String?
    let location: Location?
    let categories: [String]?
    let ageRestriction: String?
    let price: String?
    let isFree: Bool?
    let images: [Image]?
    let shortTitle: String?

    enum CodingKeys: String, CodingKey {
        case id
        case dates
        case title
        case description
        case bodyText = "body_text"
        case location
        case categories
        case ageRestriction = "age_restriction"
        case price
        case isFree = "is_free"
        case images
        case shortTitle = "short_title"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        dates = try container.decodeIfPresent([DateElement].self, forKey: .dates)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        bodyText = try container.decodeIfPresent(String.self, forKey: .bodyText)
        location = try container.decodeIfPresent(Location.self, forKey: .location)
        categories = try container.decodeIfPresent([String].self, forKey: .categories)

        // Попытка декодирования ageRestriction как строки и числа
        if let ageRestrictionString = try? container.decode(String.self, forKey: .ageRestriction) {
            ageRestriction = ageRestrictionString
        } else if let ageRestrictionInt = try? container.decode(Int.self, forKey: .ageRestriction) {
            ageRestriction = String(ageRestrictionInt)
        } else {
            ageRestriction = nil
        }

        price = try container.decodeIfPresent(String.self, forKey: .price)
        isFree = try container.decodeIfPresent(Bool.self, forKey: .isFree)
        images = try container.decodeIfPresent([Image].self, forKey: .images)
        shortTitle = try container.decodeIfPresent(String.self, forKey: .shortTitle)
    }
}
struct DateElement: Codable, Hashable {
    let startDate: String?
    let startTime: String?
    let endDate: String?
    let endTime: String?

    enum CodingKeys: String, CodingKey {
        case startDate = "start_date"
        case startTime = "start_time"
        case endDate = "end_date"
        case endTime = "end_time"
    }
}
struct Image: Codable, Hashable {
//    imageLink
    let image: String
}
struct Location: Codable, Hashable {
    let slug: String?
}
struct EventsResponse: Codable, Hashable {
    let count: Int?
//    next page link response
    let next: String?
//    previous page link response
    let previous: String?
    let results: [Event]?
}
enum CitySlug: String {
    case spb = "Санкт-Петербург"
    case msk = "Москва"
    case nsk = "Новосибирск"
    case ekb = "Екатеринбург"
    case nnv = "Нижний Новгород"
    case kzn = "Казань"
    case vbg = "Выборг"
    case smr = "Самара"
    case krd = "Краснодар"
    case sochi = "Сочи"
    case ufa = "Уфа"
    case krasnoyarsk = "Красноярск"
    case kev = "Киев"
    case newYork = "Нью-Йорк"

    static func getFullCityNameFromSlug(slug: String) -> String {
        switch slug.lowercased() {
        case "spb": return CitySlug.spb.rawValue
        case "msk": return CitySlug.msk.rawValue
        case "nsk": return CitySlug.nsk.rawValue
        case "ekb": return CitySlug.ekb.rawValue
        case "nnv": return CitySlug.nnv.rawValue
        case "kzn": return CitySlug.kzn.rawValue
        case "vbg": return CitySlug.vbg.rawValue
        case "smr": return CitySlug.smr.rawValue
        case "krd": return CitySlug.krd.rawValue
        case "sochi": return CitySlug.sochi.rawValue
        case "ufa": return CitySlug.ufa.rawValue
        case "krasnoyarsk": return CitySlug.krasnoyarsk.rawValue
        case "kev": return CitySlug.kev.rawValue
        case "newYork": return CitySlug.newYork.rawValue
        default: return slug
        }
    }

}

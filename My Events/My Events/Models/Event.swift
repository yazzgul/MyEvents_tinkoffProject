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

    enum EventCodingKeys: String, CodingKey {
        case id
        case dates
        case title
        case decscription
        case bodyText = "body_text"
        case location
        case categories
        case ageRestriction = "age_restriction"
        case price
        case isFree = "is_free"
        case images
        case shortTitle = "short_title"
    }
}
struct DateElement: Codable, Hashable {
    let startDate: String?
    let startTime: String?
    let endDate: String?
    let endTime: String?

    enum DateCodingKeys: String, CodingKey {
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
//    city
    let name: String?
    let timezone: String?
}
struct EventsResponse: Codable, Hashable {
    let count: Int?
//    next page link response
    let next: String?
//    previous page link response
    let previous: String?
    let results: [Event]?
}
struct EventDecoded: Equatable {
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
    let images: [UIImage]?
    let shortTitle: String?
}

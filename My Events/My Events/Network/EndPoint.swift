import Foundation

struct EndPoint {
    let valueForQuery: String
}
extension EndPoint {
//    valueForQuery = page number
    var allEventsUrl: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "kudago.com"
        components.path = "/public-api/v1.2/events/"
        components.queryItems = [
            URLQueryItem(name: "lang", value: "en"),
            URLQueryItem(name: "page", value: valueForQuery),
            URLQueryItem(name: "page_size", value: "30"),
            URLQueryItem(name: "fields",
                         value: "id,dates,title,short_title,description,body_text,location,categories,age_restriction,price,is_free,images"),
            URLQueryItem(name: "expand", value: "dates")
        ]
        guard let url = components.url else {
            print(NetworkError.invalidURL)
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }
    
//    valueForQuery = events id
    var allEventsByIdsUrl: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "kudago.com"
        components.path = "/public-api/v1.2/events/"
        components.queryItems = [
            URLQueryItem(name: "lang", value: "en"),
            URLQueryItem(name: "fields",
                         value: "id,dates,title,short_title,description,body_text,location,categories,age_restriction,price,is_free,images"),
            URLQueryItem(name: "expand", value: "dates"),
            URLQueryItem(name: "ids", value: valueForQuery)
        ]
        guard let url = components.url else {
            print(NetworkError.invalidURL)
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }
//    valueForQuery = events location (city slug like: kzn)
    var allEventsWithLocationFilter: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "kudago.com"
        components.path = "/public-api/v1.2/events/"
        components.queryItems = [
            URLQueryItem(name: "lang", value: "en"),
            URLQueryItem(name: "fields",
                         value: "id,dates,title,short_title,description,body_text,location,categories,age_restriction,price,is_free,images"),
            URLQueryItem(name: "expand", value: "dates"),
            URLQueryItem(name: "location", value: valueForQuery)
        ]
        guard let url = components.url else {
            print(NetworkError.invalidURL)
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }

//    valueForQuery = event id
    var detailEventUrl: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "kudago.com"
        components.path = "/public-api/v1.2/events/" + valueForQuery + "/"
        components.queryItems = [
            URLQueryItem(name: "lang", value: "en"),
            URLQueryItem(name: "fields", value: "id,title,description,images"),
            URLQueryItem(name: "expand", value: "dates")
        ]
        guard let url = components.url else {
            print(NetworkError.invalidURL)
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }

}

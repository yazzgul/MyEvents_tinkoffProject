import Foundation

struct EndPoint {
    let path: String
}
extension EndPoint {
//    path = page number
    var allEventsUrl: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "kudago.com"
        components.path = "/public-api/v1.2/events/"
        components.queryItems = [
            URLQueryItem(name: "lang", value: "en"),
            URLQueryItem(name: "page", value: path),
            URLQueryItem(name: "page_size", value: "50"),
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

//    path = event id
    var detailEventUrl: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "kudago.com"
        components.path = "/public-api/v1.2/events/" + path + "/"
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

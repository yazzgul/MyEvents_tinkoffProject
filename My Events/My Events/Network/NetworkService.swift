import Foundation
import UIKit

class NetworkService: NetworkServiceProtocol {
    
    static let shared = NetworkService()

    private init() {}

    func fetchAllEventsByPage(byPage: String, response: @escaping ([Event]?, NetworkError?) -> Void) {
        let url = EndPoint(valueForQuery: byPage).allEventsUrl

        NetworkRequest.shared.getData(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let eventsResponse = try JSONDecoder().decode(EventsResponse.self, from: data)
                    response(eventsResponse.results, nil)
                } catch let jsonError {
                    print("Failed to decode JSON: ", jsonError)
                }
            case .failure(_):
                response(nil, .decodingError)
            }
        }
    }

    func fetchAllEventsByIds(byIds: String, response: @escaping ([Event]?, NetworkError?) -> Void) {
        let url = EndPoint(valueForQuery: byIds).allEventsByIdsUrl

        NetworkRequest.shared.getData(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let eventsResponse = try JSONDecoder().decode(EventsResponse.self, from: data)
                    response(eventsResponse.results, nil)
                } catch let jsonError {
                    print("Failed to decode JSON: ", jsonError)
                }
            case .failure(_):
                response(nil, .decodingError)
            }
        }
    }
    func fetchEventDetailById(byId: String, response: @escaping (Event?, NetworkError?) -> Void) {
        let url = EndPoint(valueForQuery: byId).detailEventUrl

        NetworkRequest.shared.getData(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let event = try JSONDecoder().decode(Event.self, from: data)
                    response(event, nil)
                } catch let jsonError {
                    print("Failed to decode JSON: ", jsonError)
                }
            case .failure(_):
                response(nil, .decodingError)
            }
        }

    }

}

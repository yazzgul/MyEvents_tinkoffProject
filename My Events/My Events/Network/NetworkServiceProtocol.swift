import Foundation
import UIKit

protocol NetworkServiceProtocol {
    func fetchAllEventsByPage(byPage: String, response: @escaping ([Event]?, NetworkError?) -> Void)
    func fetchEventDetailById(byId: String, response: @escaping (Event?, NetworkError?) -> Void)
}

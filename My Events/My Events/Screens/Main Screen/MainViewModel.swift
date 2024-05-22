import Foundation
import UIKit
import Combine

class MainViewModel {
    private var cancellables = Set<AnyCancellable>()
    @Published var events: [Event] = []
    @Published var eventsAreEmpty = true


    init(events: [Event]? = nil) {
        self.events = events ?? []
    }
    
    func getAllEvents() {
        NetworkService.shared.fetchAllEventsByPage(byPage: "2") { [weak self] events, error in
            guard let self else { return }
            if error != nil {
//                add alert
                print("error: ", error)
            } else if let events {
                self.events = events
                print("events count: ", events.count)
            }
            checkEventsEmpty()
        }
    }
//    перемещу метод в другой вьюмодел, проверила работает ли запрос
    func getEventDetailById() {
        NetworkService.shared.fetchEventDetailById(byId: "161043") { [weak self] event, error in
            guard let self else { return }
            if error != nil {
                print("error: ", error)
            } else if let event {
                self.events.append(event)
                print("events count: ", events.count)
            }
        }
    }

    func checkEventsEmpty() {
        if !events.isEmpty {
            eventsAreEmpty = false
        } else {
            eventsAreEmpty = true
        }
    }

}
extension MainViewModel {
    func numberOfRowsInSection() -> Int {
        events.count
    }
    func configureCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as? MainTableViewCell
        guard let cell = cell else { return UITableViewCell() }
//        тут пока для проверки что фото декодируется (работает)
//        let event = events[indexPath.row]
//        if let imageLink = event.images?.first?.image {
//            Task {
//                let image = try? await NetworkRequest.shared.downloadImage(by: imageLink)
//                if let imageReady = image {
//                    await cell.configureCell(with: event, image: imageReady)
//                }
//
//            }
//        }
        cell.configureCell(with: events[indexPath.row])

        return cell
    }
}

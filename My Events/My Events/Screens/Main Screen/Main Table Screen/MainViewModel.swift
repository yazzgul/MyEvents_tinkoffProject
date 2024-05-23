import UIKit
import Combine

class MainViewModel {
    private var cancellables = Set<AnyCancellable>()
    private var eventService = EventService.shared

    @Published var eventsAreEmpty = true

    func getAllEvents() {
        NetworkService.shared.fetchAllEventsByPage(byPage: "4") { [weak self] events, error in
            guard let self else { return }
            if error != nil {
//                add alert
                print("error: ", error)
            } else if let events {
                eventService.events = events
//                self.events = events
                print("events count: ", eventService.events.count, eventService.getCount())
            }
            checkEventsEmpty()
        }
    }
//    перемещу метод в другой вьюмодел, проверила работает ли запрос
    func getEventDetailById(byId: Int) {
        let id = String(byId)
        NetworkService.shared.fetchEventDetailById(byId: id) { [weak self] event, error in
            guard let self else { return }
            if error != nil {
                print("error: ", error)
            } else if let event {
                eventService.events.append(event)
                print("events count: ", eventService.getCount())
            }
        }
    }

    func checkEventsEmpty() {
        eventsAreEmpty = eventService.eventsAreEmpty()
    }

}
extension MainViewModel {
    func numberOfRowsInSection() -> Int {
        eventService.getCount()
    }
    func configureCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as? MainTableViewCell
        guard let cell = cell else { return UITableViewCell() }

        let event = eventService.events[indexPath.row]

        if let imageLink = event.images?.first?.image {
            Task {
                let image = try? await ImageNetworkManager.shared.downloadImage(by: imageLink)
                print(ImageNetworkManager.shared.cashedImages.count)
                if let imageReady = image {
                    DispatchQueue.main.async {
                        cell.configureCell(with: imageReady)
                    }
                } else {
                    if let noPicture = UIImage(named: "no_photo") {
                        await cell.configureCell(with: noPicture)
                    }
                }

            }
        }

        cell.configureCell(with: event)

        return cell
    }
}

import UIKit
import Combine

class MainViewModel {
    private var cancellables = Set<AnyCancellable>()
    private var eventService = EventService.shared
//    private var randomPageNumber = 1

    @Published var eventsAreEmpty = true

    func getAllEvents() {
        let randomPageNumber = String(getRandomNumber())

        NetworkService.shared.fetchAllEventsByPage(byPage: randomPageNumber) { [weak self] events, error in
            guard let self else { return }
            if error != nil {
                print("error: ", error)
            } else if let events {
                eventService.saveEventsArray(with: events)
            }
            checkEventsEmpty()
        }
    }
    func getRandomNumber() -> Int {
        let randomInt = Int.random(in: 1...100)
        return randomInt
    }
////    перемещу метод в другой вьюмодел, проверила работает ли запрос
//    func getEventDetailById(byId: Int) {
//        let id = String(byId)
//        NetworkService.shared.fetchEventDetailById(byId: id) { [weak self] event, error in
//            guard let self else { return }
//            if error != nil {
//                print("error: ", error)
//            } else if let event {
//                eventService.saveEvent(with: event)
//                print("events count: ", eventService.getCount())
//            }
//        }
//    }

    func checkEventsEmpty() {
        eventsAreEmpty = eventService.eventsAreEmpty()
    }

}
extension MainViewModel {
    func numberOfRowsInSection(searchController: UISearchController) -> Int {
        let inSearchMode = inSearchMode(searchController)
        return inSearchMode ? eventService.getSearchBarFilteredEventsCount() : eventService.getCount()
    }
    func configureCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, searchController: UISearchController) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as? MainTableViewCell
        guard let cell = cell else { return UITableViewCell() }

        let inSearchMode = inSearchMode(searchController)

        let event = inSearchMode ? eventService.searchBarFilteredEvents[indexPath.row] : eventService.events[indexPath.row]

//        let event = eventService.events[indexPath.row]

        if let imageLink = event.images?.first?.image {
            Task {
                let image = try? await ImageNetworkManager.shared.downloadImage(by: imageLink)
//                print(ImageNetworkManager.shared.cashedImages.count)
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

    func saveCurrentMainTableSelectedEventInEventService(_ tableView: UITableView,
                                                         didSelectRowAt indexPath: IndexPath,
                                                         searchController: UISearchController) {

        let inSearchMode = inSearchMode(searchController)

        let event = inSearchMode ? eventService.searchBarFilteredEvents[indexPath.row] : eventService.events[indexPath.row]

//        let event = eventService.events[indexPath.row]
        eventService.mainTableSelectedEvent = event
    }

}
extension MainViewModel {
    func inSearchMode(_ searchController: UISearchController) -> Bool {
        let isActive = searchController.isActive
        let searchText = searchController.searchBar.text ?? ""

        return isActive && !searchText.isEmpty
    }

    func updateSearchController(searchBarText: String?) {
        eventService.saveSearchBarFilteredEvents(with: eventService.getAllEvents())

        if let searchText = searchBarText?.lowercased() {
            guard !searchText.isEmpty else { print("no text in search bar"); return }

            let newFilteredEventsArrayByText = eventService.getSearchBarFilteredEvents().filter({ $0.title.lowercased().contains(searchText) })

            eventService.saveSearchBarFilteredEvents(with: newFilteredEventsArrayByText)
        }

    }
    
}

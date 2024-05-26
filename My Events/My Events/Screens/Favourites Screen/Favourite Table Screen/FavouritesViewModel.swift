import UIKit
import Combine

class FavouritesViewModel {

    private var cancellables = Set<AnyCancellable>()
    private var eventService = EventService.shared

    let dispatchGroup = DispatchGroup()

    @Published var userFavouriteEventsAreEmpty = true

    func getUserFavouriteEventById(byId: Int) {
        let id = String(byId)
        NetworkService.shared.fetchEventDetailById(byId: id) { [weak self] event, error in
            guard let self else { return }
            if error != nil {
                print("error: ", error?.localizedDescription)
            } else if let event {
                eventService.saveEventInUserFavouriteEvents(with: event)
                print("events count: ", eventService.getUserFavouriteEventsCount())
            }
        }
    }

    func getAllUserFavouriteEventsByIdArray() {
        let user = UserService.shared.getCurrentUser()
        if let favoriteEventsId = user?.favoriteEventsId {
            eventService.fetchFavouriteEvents(byIds: favoriteEventsId) { [weak self] events, error in
                guard let self else { return }
                if let events = events {
                    self.eventService.saveUserFavouriteEvents(with: events)
                    checkUserFavouriteEventsChanging()
                } else if let error = error {
                    print("Error fetching events: \(error)")
                }
            }
        }
    }

    func checkUserFavouriteEventsChanging() {
        userFavouriteEventsAreEmpty = eventService.eventsAreEmpty()
    }

}
extension FavouritesViewModel {
    func numberOfRowsInSection() -> Int {
        return eventService.getUserFavouriteEventsCount()
    }
    
    func configureCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouritesTableViewCell.reuseIdentifier, for: indexPath) as? FavouritesTableViewCell
        guard let cell = cell else { return UITableViewCell() }

        let event = eventService.userFavouriteEvents[indexPath.row]

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

    func saveCurrentFavouriteTableSelectedEventInEventService(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = eventService.userFavouriteEvents[indexPath.row]

        eventService.userFavouriteTableSelectedEvent = event
        print("EVENT FROM SELECTED: ", event)
    }

}

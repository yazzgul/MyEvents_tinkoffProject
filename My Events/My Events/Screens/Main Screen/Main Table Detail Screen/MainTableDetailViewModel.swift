import UIKit

class MainTableDetailViewModel {

    private var eventService = EventService.shared

    func fetchSelectedEvent() -> Event? {
        if let event = eventService.mainTableSelectedEvent {
            return event
        }
        return nil
    }

    func fetchSelectedEventImage(completion: @escaping (UIImage?) -> Void) {
        let noImage = UIImage(named: "no_photo")
        if let event = eventService.mainTableSelectedEvent, let imageLink = event.images?.first?.image {
            Task {
                do {
                    let image = try await ImageNetworkManager.shared.downloadImage(by: imageLink)
                    DispatchQueue.main.async {
                        completion(image)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(noImage)
                    }
                }
            }
        } else {
            completion(noImage)
        }
    }

    func saveFavoriteEvent(with event: Event) {
        var curUser = UserService.shared.getCurrentUser()

        curUser?.favoriteEventsId.append(event.id)
        if let curUser = curUser {
            UserService.shared.setUpdatedUser(user: curUser)

            UserService.shared.updateUserInfo(with: curUser) { result in
                switch result {
                case .success(let user):
                    print("USER!!! WITH ARRAY: ", user.favoriteEventsId)
                case .failure(let error):
                    print(error.localizedDescription)
                }

            }
        }

    }

    func deleteFavouriteEvent(with event: Event) {
        var curUser = UserService.shared.getCurrentUser()

        let id = event.id
        
        if var curUser = curUser {
            if let index = curUser.favoriteEventsId.firstIndex(of: id) {
                curUser.favoriteEventsId.remove(at: index)
            } else {
                print("event не в избранных", event)
                return
            }
            UserService.shared.setUpdatedUser(user: curUser)

            UserService.shared.updateUserInfo(with: curUser) { result in
                switch result {
                case .success(let user):
                    print("USER!!! WITH ARRAY: ", user.favoriteEventsId)
                case .failure(let error):
                    print(error.localizedDescription)
                }

            }
        }

    }

    func equelEventsForBookmark(selectedEvent: Event) -> Bool {
        let curUser = UserService.shared.getCurrentUser()
        let selectedId = selectedEvent.id

        if let curUser = curUser {
            if let index = curUser.favoriteEventsId.firstIndex(of: selectedId) {
                return true
            }
        }
        return false
    }
    func getBookmarkImageName(selectedEvent: Event) -> String {
        if equelEventsForBookmark(selectedEvent: selectedEvent) {
            return "bookmark-black"
        } else {
            return "bookmark"
        }
    }

}

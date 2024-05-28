import UIKit
import Combine

class FavouritesTableDetailViewModel {
    private var cancellables = Set<AnyCancellable>()
    private var eventService = EventService.shared

    func fetchSelectedEvent() -> Event? {
        if let event = eventService.userFavouriteTableSelectedEvent {
            return event
        }
        return nil
    }

    func fetchSelectedEventImage(completion: @escaping (UIImage?) -> Void) {
        let noImage = UIImage(named: "no_photo")
        if let event = eventService.userFavouriteTableSelectedEvent, let imageLink = event.images?.first?.image {
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
        let curUser = UserService.shared.getCurrentUser()

        if var curUser = curUser {
            if curUser.favoriteEventsId.contains(where: { $0 == event.id }) {
                print("event уже есть в избранных")
                return
            }
            curUser.favoriteEventsId.append(event.id)
            //  обновляем информацию про пользователя в локальном сервисе пользователя
            UserService.shared.setUpdatedUser(user: curUser)
            //  сохраняем ивент в кэш
            eventService.saveEventInUserFavouriteEvents(with: event)
            //  обновляем информацию про пользователя на удаленном сервере (firebase)
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
        let curUser = UserService.shared.getCurrentUser()

        let id = event.id

        if var curUser = curUser {
            if let index = curUser.favoriteEventsId.firstIndex(of: id) {
                curUser.favoriteEventsId.remove(at: index)
            } else {
                print("event не в избранных", event)
                return
            }
            //  обновляем информацию про пользователя в локальном сервисе пользователя
            UserService.shared.setUpdatedUser(user: curUser)
            //  удаляем ивент из кэша
            eventService.removeEventFromUserFavouriteEvents(with: event)
            //  обновляем информацию про пользователя на удаленном сервере (firebase)
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
    func isEventFavourite(selectedEvent: Event) -> Bool {
        let curUser = UserService.shared.getCurrentUser()
        let selectedId = selectedEvent.id

        if let curUser = curUser {
            return curUser.favoriteEventsId.contains(where: { $0 == selectedId })
        }
        return false
    }

// если ивент уже в избранных то детальный экран открывается с черным флажком
    func getBookmarkImageNameBySelectedEventBeforeAnimation(selectedEvent: Event) -> String {
        if isEventFavourite(selectedEvent: selectedEvent) {
            return "bookmark-black"
        } else {
            return "bookmark"
        }
    }

}

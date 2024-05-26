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
}

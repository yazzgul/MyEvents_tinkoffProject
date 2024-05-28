import Foundation
import Combine

// MARK: - класс для работы с массивами event`ов. Предназначен для получения и кэширования обьектов с сети и для хранения выбранных обьектов для detail screens

class EventService {
    public static let shared = EventService()

    private init() {}

    private let lock = NSLock()

    @Published var events: [Event] = []
    @Published var searchBarFilteredEvents: [Event] = []
    @Published var userFavouriteEvents: [Event] = []
    private var userFavouriteEventsId: [Int] = []
    private let dispatchGroup = DispatchGroup()


    var mainTableSelectedEvent: Event?
    var userFavouriteTableSelectedEvent: Event?

    func fetchFavouriteEvents(byIds: [Int], completion: @escaping ([Event]?, NetworkError?) -> Void) {
        var gotEvents: [Event] = []
        var errors: [NetworkError] = []

        saveUserFavouriteEventsIdArray(with: byIds)

        if !byIds.isEmpty {
            for id in byIds {
                let idString = String(id)
                dispatchGroup.enter()
                NetworkService.shared.fetchEventDetailById(byId: idString) { [weak self] event, error in
                    guard let self else { return }
                    if let event = event {
                        gotEvents.append(event)
                    } else if let error = error {
                        errors.append(error)
                        print("error in getting favourite events", error.localizedDescription)
                    }
                    self.dispatchGroup.leave()
                }
            }
            dispatchGroup.notify(queue: .main) {
                if errors.isEmpty {
                    completion(gotEvents, nil)
                    print("GOTEVENTS")
                } else {
                    completion(nil, errors.first)
                }
            }

        }

    }

// MARK: - методы для всех event в главной main table screen
    func saveEvent(with event: Event) {
        lock.lock()
        if !events.contains(where: { $0.id == event.id }) {
            events.append(event)
        }
        lock.unlock()
    }
    
    func saveEventsArray(with newEvents: [Event]) {
        lock.lock()
        events = newEvents
        lock.unlock()
    }

    func removeEvent(at index: Int) {
        lock.lock()
        events.remove(at: index)
        lock.unlock()
    }

    func removeEvent(with event: Event) {
        lock.lock()
        if let index = events.firstIndex(of: event) {
            events.remove(at: index)
        }
        lock.unlock()
    }

    func getEvent(at index: Int) -> Event {
        return events[index]
    }

    func getEvent(by id: Int) -> Event? {
        if let event = events.first(where: { $0.id == id }) {
            return event
        }
        return nil
    }

    func getAllEvents() -> [Event] {
        return events
    }

    func getCount() -> Int {
        return events.count
    }

    func eventsAreEmpty() -> Bool {
        return events.isEmpty
    }

// MARK: - методы для всех отфильтрованных search bar`ом event в главной main table screen
    func saveSearchBarFilteredEvents(with eventsArray: [Event]) {
        searchBarFilteredEvents = eventsArray
    }
    
    func getSearchBarFilteredEvents() -> [Event] {
        return searchBarFilteredEvents
    }
    func getSearchBarFilteredEventsCount() -> Int {
        return searchBarFilteredEvents.count
    }

// MARK: - методы для избранных event текущего пользователя в favourite table screen (тип Event)
    func saveUserFavouriteEvents(with eventsArray: [Event]) {
        lock.lock()
        userFavouriteEvents = eventsArray
        lock.unlock()
    }

    func getUserFavouriteEvents() -> [Event] {
        return userFavouriteEvents
    }

    func getUserFavouriteEventsCount() -> Int {
        return userFavouriteEvents.count
    }

    func userFavouriteEventsAreEmpty() -> Bool {
        return userFavouriteEvents.isEmpty
    }

    func saveEventInUserFavouriteEvents(with event: Event) {
        lock.lock()
        if !events.contains(where: { $0.id == event.id }) {
            events.append(event)
        }
        lock.unlock()
    }

    func removeEventFromUserFavouriteEvents(at index: Int) {
        lock.lock()
        userFavouriteEvents.remove(at: index)
        lock.unlock()
    }

    func removeEventFromUserFavouriteEvents(with event: Event) {
        lock.lock()
        if let index = userFavouriteEvents.firstIndex(of: event) {
            userFavouriteEvents.remove(at: index)
        }
        lock.unlock()
    }

    func getEventFromUserFavouriteEvents(at index: Int) -> Event {
        return userFavouriteEvents[index]
    }

    func getEventFromUserFavouriteEvents(by id: Int) -> Event? {
        if let event = userFavouriteEvents.first(where: { $0.id == id }) {
            return event
        }
        return nil
    }

// MARK: - методы для избранных event текущего пользователя в favourite table screen (тип Int для Id event`ов)
    func saveUserFavouriteEventsIdArray(with eventsIdArray: [Int]) {
        lock.lock()
        userFavouriteEventsId = eventsIdArray
        lock.unlock()
    }

    func getUserFavouriteEventsIdArray() -> [Int] {
        return userFavouriteEventsId
    }

    func getUserFavouriteEventsIdArrayCount() -> Int {
        return userFavouriteEventsId.count
    }

    func userFavouriteEventsIdArrayAreEmpty() -> Bool {
        return userFavouriteEventsId.isEmpty
    }

    func saveIdInUserFavouriteEventsIdArray(with id: Int) {
        lock.lock()
        if !userFavouriteEventsId.contains(where: { $0 == id }) {
            userFavouriteEventsId.append(id)
        }
        lock.unlock()
    }

    func removeIdFromUserFavouriteEventsIdArray(at index: Int) {
        lock.lock()
        userFavouriteEventsId.remove(at: index)
        lock.unlock()
    }

    func removeIdFromUserFavouriteEventsIdArray(with id: Int) {
        lock.lock()
        if let index = userFavouriteEventsId.firstIndex(of: id) {
            userFavouriteEventsId.remove(at: index)
        }
        lock.unlock()
    }

    func getIdFromUserFavouriteEventsIdArray(at index: Int) -> Int {
        return userFavouriteEventsId[index]
    }

}

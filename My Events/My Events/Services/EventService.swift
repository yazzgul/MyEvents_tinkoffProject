import Foundation
import Combine

class EventService {
    public static let shared = EventService()

    private init() {}

    private let lock = NSLock()

    @Published var events: [Event] = []
    @Published var searchBarFilteredEvents: [Event] = []

    var mainTableSelectedEvent: Event?
    var userFavouriteTableSelectedEvent: Event?

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

    func saveSearchBarFilteredEvents(with eventsArray: [Event]) {
        searchBarFilteredEvents = eventsArray
    }
    
    func getSearchBarFilteredEvents() -> [Event] {
        return searchBarFilteredEvents
    }
    func getSearchBarFilteredEventsCount() -> Int {
        return searchBarFilteredEvents.count
    }

}

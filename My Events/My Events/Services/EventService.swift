import Foundation
import Combine

class EventService {
    public static let shared = EventService()

    private init() {}

    private let lock = NSLock()

    @Published var events: [Event] = []

    func saveEvent(with event: Event) {
        lock.lock()
        events.append(event)
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
        if let event =  events.first(where: { $0.id == id }) {
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
}

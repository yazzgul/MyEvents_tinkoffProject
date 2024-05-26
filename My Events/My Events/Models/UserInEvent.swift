import Foundation

struct UserInEvent {
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    var favoriteEventsId: [Int]

    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["firstName"] = self.firstName
        repres["lastName"] = self.lastName
        repres["email"] = self.email
        repres["favoriteEventsId"] = self.favoriteEventsId

        return repres
    }
}

import Foundation

class ProfileViewModel {

    init() {
        UserService.shared.getUserFromDatabase()
    }

    func getUserFirstName() -> String? {
        UserService.shared.getCurrentUserFirstName()
    }
    func getUserLastName() -> String? {
        UserService.shared.getCurrentUserLastName()
    }
    func getUserEmail() -> String? {
        UserService.shared.getCurrentUserEmail()
    }

    func signOutFromProfile() {
        AuthService.shared.signOut()
    }

}

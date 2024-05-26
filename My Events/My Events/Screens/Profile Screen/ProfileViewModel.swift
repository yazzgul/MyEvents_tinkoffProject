import Foundation

class ProfileViewModel {

    @Published var currentUser: UserInEvent?

    init(currentUser: UserInEvent? = nil) {
        self.currentUser = currentUser
        UserService.shared.getUserFromDatabase()
    }

    func getProfile() {
        currentUser = UserService.shared.getCurrentUser()
    }

    func signOutFromProfile() {
        AuthService.shared.signOut()
    }


}

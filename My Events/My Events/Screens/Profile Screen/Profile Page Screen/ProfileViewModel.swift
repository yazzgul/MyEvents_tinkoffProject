import UIKit
import Combine

// MARK: - вью модель экрана профиля

class ProfileViewModel {
    
    init() {
        UserService.shared.getUserFromDatabase()
    }

    var currentUserPublisher: AnyPublisher<UserInEvent?, Never> {
        return UserService.shared.$currentUser
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
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
    func getUserImage() -> UIImage? {
        UserService.shared.getCurrentUserImage()
    }

    func signOutFromProfile() {
        AuthService.shared.signOut()
    }

    func deleteProfile(completion: @escaping (Bool, Error?) -> Void) {
        FirestoreDatabaseService.shared.deleteUser { error in
            if let error = error {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }

}

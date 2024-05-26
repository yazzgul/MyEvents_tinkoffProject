import Foundation
import Combine

// MARK: - сервис, где хранится текущий пользователь с типом UserInEvent

class UserService {

    static let shared = UserService()

    private init() {
        getUserFromDatabase()
    }

    private var currentUser: UserInEvent?

    func getUserFromDatabase() {
        DatabaseService.shared.getUser { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let user):
                self.currentUser = user
                print(")()()()(*(**!(!&*(@", user.firstName, user.email)
            case .failure(let error):
                print("error in getting user profile: ", error.localizedDescription)
            }
        }
    }

    func getCurrentUserFavoriteEventsId() -> [Int]? {
        return currentUser?.favoriteEventsId
    }
    func getCurrentUserFirstName() -> String? {
        return currentUser?.firstName
    }
    func getCurrentUserLastName() -> String? {
        return currentUser?.lastName
    }
    func getCurrentUserEmail() -> String? {
        return currentUser?.email
    }
    func getCurrentUser() -> UserInEvent? {
        return currentUser
    }
    func updateUserInfo(with userInEvent: UserInEvent, completion: @escaping (Result<UserInEvent, Error>) -> Void) {
//        let newUser = UserInEvent(id: result.user.uid,
//                                  firstName: firstName,
//                                  lastName: lastName,
//                                  email: email,
//                                  favoriteEventsId: [])
        DatabaseService.shared.createUser(user: userInEvent) { resultDB in
            switch resultDB {
            case .success(_):
                completion(.success(userInEvent))
            case .failure(let error):
                completion(.failure(error))
            }

        }
    }
    func setUpdatedUser(user: UserInEvent) {
        currentUser = user
    }

}

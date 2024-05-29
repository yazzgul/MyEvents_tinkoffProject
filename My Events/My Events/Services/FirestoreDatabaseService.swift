import Foundation
import FirebaseFirestore

// MARK: - сервис для работы с Firestore  (датабаза Firebase)

class FirestoreDatabaseService {

    static let shared = FirestoreDatabaseService()

    private init() {}

    private let dataBase = Firestore.firestore()

    private var usersReference: CollectionReference {
        return dataBase.collection("users")
    }

    func createUser(user: UserInEvent, completion: @escaping (Result<UserInEvent, Error>) -> Void) {
        usersReference.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    func getUser(completion: @escaping (Result<UserInEvent, Error>) -> Void) {
        guard let currentUserUID = AuthService.shared.currentUser?.uid else { print("error in getting uid of current user"); return }
        usersReference.document(currentUserUID).getDocument { documentSnapshot, error in
            guard let docSnap = documentSnapshot else { print("error in parsing user from firebase"); return }
            guard let data = docSnap.data() else {print("error in getting user dates"); return}
            if let userId = data["id"] as? String,
               let userFirstName = data["firstName"] as? String,
               let userLastName = data["lastName"] as? String,
               let userEmal = data["email"] as? String,
               let userFavoriteEventsId = data["favoriteEventsId"] as? [Int] {
                let parsedUser = UserInEvent(id: userId,
                                             firstName: userFirstName,
                                             lastName: userLastName,
                                             email: userEmal,
                                             favoriteEventsId: userFavoriteEventsId)

                completion(.success(parsedUser))
            } else {
                if let error = error {
                    completion(.failure(error))
                }
            }
        }
    }
//    func deleteUser(withId id: String) async {
//        do {
//            try await dataBase.collection("users").document(id).delete()
//            print("User deleted successfully.")
//        } catch {
//            print("Error deleting user: \(error.localizedDescription)")
//            await alertShowable?.showCustomAlertAsync(title: "Error", message: "Error deleting user: \(error.localizedDescription)")
//        }
//    }
}

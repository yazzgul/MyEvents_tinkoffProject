import Foundation
import Combine

class LoginModel {

    @Published var successfulyEnterLogin = false

    func signInUser(email: String, password: String) {
        AuthService.shared.signIn(email: email, password: password) { result in
            switch result {
            case .success( _ ):
                self.successfulyEnterLogin = true
                print("Авторизация прошла успешно!")
            case .failure(let error):
                print("Ошибка при авторизации \(error.localizedDescription)!")
            }
        }
    }
    
}

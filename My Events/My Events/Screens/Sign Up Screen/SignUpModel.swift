import Foundation
import FirebaseCore
import FirebaseAuth
import Combine

class SignUpModel {

    @Published var successfulySignUp = false

    func signUpUser(email: String, password: String, passwordAgain: String, userName: String) {
        if password == passwordAgain {
            AuthService.shared.signUp(email: email, password: password) { result in
                switch result {
                case .success(let user):
                    self.successfulySignUp = true
                    print("Регистрация прошла успешно!")
                case .failure(let error):
                    print("Ошибка при регистрации \(error.localizedDescription)!")
                }
            }
        }
    }
    
}

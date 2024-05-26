import Foundation
import FirebaseCore
import FirebaseAuth
import Combine

class SignUpViewModel {

    @Published var successfulySignUp = false

    func signUpUser(email: String, password: String, passwordAgain: String, userName: String) {
        let parts = userName.split(separator: " ", maxSplits: 1, omittingEmptySubsequences: true)

        if parts.count == 2 && password == passwordAgain {
            print("you entered your name correctly")
            let userFirstName = String(parts[0])
            let userLastName = String(parts[1])

            AuthService.shared.signUp(email: email, password: password, firstName: userFirstName, lastName: userLastName) { result in
                switch result {
                case .success(let user):
                    self.successfulySignUp = true
                    print("Регистрация прошла успешно!")
                case .failure(let error):
                    print("Ошибка при регистрации \(error.localizedDescription)!")
                }
            }
        }
        else {
            print("enter your name correctly")
        }
    }

}

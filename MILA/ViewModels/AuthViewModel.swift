import SwiftUI

final class AuthViewModel: ObservableObject {

    @Published var isLoggedIn: Bool = false
    @Published var currentUser: User? = nil

    func login(email: String, password: String) {
        guard !email.isEmpty, !password.isEmpty else { return }
        currentUser = User(name: "Reader", email: email)
        isLoggedIn = true
    }

    func signup(name: String, email: String, password: String) {
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty else { return }
        currentUser = User(name: name, email: email)
        isLoggedIn = true
    }

    func logout() {
        currentUser = nil
        isLoggedIn = false
    }
}

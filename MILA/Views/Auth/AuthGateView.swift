import SwiftUI

struct AuthGateView: View {

    @EnvironmentObject var authVM: AuthViewModel

    var body: some View {
        if authVM.isLoggedIn {
            MainTabView()
        } else {
            LoginView()
        }
    }
}

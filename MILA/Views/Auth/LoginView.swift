import SwiftUI

struct LoginView: View {

    @EnvironmentObject var authVM: AuthViewModel

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            ZStack {

                Image("login_bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                Color.black.opacity(0.25)
                    .ignoresSafeArea()

                VStack(spacing: 28) {

                    Spacer()

                    VStack(spacing: 14) {
                        Image("mila_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 160, height: 160)

                        Text("MILA")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.white)

                        Text("Stories beyond reality")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }

                    HStack(spacing: 0) {

                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.cyan)
                            .foregroundColor(.black)
                            .cornerRadius(14)

                        NavigationLink {
                            SignUpView()
                        } label: {
                            Text("Sign Up")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.white)
                        }
                    }
                    .background(Color.white.opacity(0.15))
                    .cornerRadius(14)

                    VStack(spacing: 14) {
                        inputField("Email", text: $email, icon: "envelope")
                        secureField("Password", text: $password)
                    }

                    HStack {
                        Spacer()
                        Text("Forgot Password?")
                            .font(.caption)
                            .foregroundColor(.cyan)
                    }

                    PrimaryButton(title: "Log In →") {
                        authVM.login(email: email, password: password)
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }

    // MARK: - Fields

    func inputField(_ placeholder: String, text: Binding<String>, icon: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.white.opacity(0.7))

            TextField("", text: text)
                .placeholder(when: text.wrappedValue.isEmpty) {
                    Text(placeholder)
                        .foregroundColor(.white.opacity(0.6))
                }
                .foregroundColor(.white)
                .tint(.white)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
        .padding()
        .background(Color.black.opacity(0.4))
        .cornerRadius(14)
    }

    func secureField(_ placeholder: String, text: Binding<String>) -> some View {
        HStack(spacing: 12) {
            Image(systemName: "lock")
                .foregroundColor(.white.opacity(0.7))

            SecureField("", text: text)
                .placeholder(when: text.wrappedValue.isEmpty) {
                    Text(placeholder)
                        .foregroundColor(.white.opacity(0.6))
                }
                .foregroundColor(.white)
                .tint(.white)
        }
        .padding()
        .background(Color.black.opacity(0.4))
        .cornerRadius(14)
    }
}

import SwiftUI

struct SignUpView: View {

    @EnvironmentObject var authVM: AuthViewModel
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var agree = false

    var body: some View {
        ZStack {

            Image("login_bg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            Color.black.opacity(0.25)
                .ignoresSafeArea()

            ScrollView {   // 🔥 FIX: FULL PAGE, NO HALF SCREEN
                VStack(spacing: 28) {

                    Spacer(minLength: 40)

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
                            .foregroundColor(.white)
                            .onTapGesture { dismiss() }

                        Text("Sign Up")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.cyan)
                            .foregroundColor(.black)
                            .cornerRadius(14)
                    }
                    .background(Color.white.opacity(0.15))
                    .cornerRadius(14)

                    VStack(spacing: 14) {
                        inputField("Full Name", text: $name, icon: "person")
                        inputField("Email", text: $email, icon: "envelope")
                        secureField("Password", text: $password)
                        secureField("Confirm Password", text: $confirmPassword)
                    }

                    Toggle("I agree to the Terms & Conditions", isOn: $agree)
                        .toggleStyle(SwitchToggleStyle(tint: .cyan))
                        .foregroundColor(.white)

                    PrimaryButton(title: "Create Account →") {
                        guard agree, password == confirmPassword else { return }
                        authVM.signup(name: name, email: email, password: password)
                    }
                    .opacity(agree ? 1 : 0.5)

                    Spacer(minLength: 40)
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
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

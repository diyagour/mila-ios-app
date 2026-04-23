import SwiftUI

struct SettingsView: View {

    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var progressStore: ReadingProgressStore
    @AppStorage("darkMode") private var darkMode = true

    var body: some View {
        ZStack {
            SpaceBackground()   // 🌌 BACKGROUND

            ScrollView {
                VStack(spacing: 24) {

                    // USER
                    VStack(alignment: .leading, spacing: 8) {
                        Text(authVM.currentUser?.name ?? "Reader")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)

                        Text(authVM.currentUser?.email ?? "")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(glass)
                    .cornerRadius(20)

                    // STATS
                    VStack(spacing: 14) {
                        stat("Books Read", "\(progressStore.booksCompleted)")
                        stat("Pages Read", "\(progressStore.pagesRead)")
                        stat("Reading Time", "\(progressStore.readingMinutes) min")
                    }
                    .padding()
                    .background(glass)
                    .cornerRadius(20)

                    // PREFERENCES
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Reading Preferences")
                            .font(.headline)
                            .foregroundColor(.white)

                        Toggle(isOn: $darkMode) {
                            Text("Dark Mode")
                                .foregroundColor(.white)
                        }
                        .toggleStyle(SwitchToggleStyle(tint: .cyan))
                    }
                    .padding()
                    .background(glass)
                    .cornerRadius(20)

                    Button("Log Out") {
                        authVM.logout()
                    }
                    .foregroundColor(.cyan)
                    .padding(.top, 20)
                }
                .padding()
            }
        }
    }

    var glass: some View {
        Color.white.opacity(0.08)
    }

    func stat(_ title: String, _ value: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.white)
            Spacer()
            Text(value)
                .foregroundColor(.white)
                .bold()
        }
    }
}


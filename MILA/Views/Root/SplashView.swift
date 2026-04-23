import SwiftUI

struct SplashView: View {

    @State private var goNext = false

    var body: some View {
        ZStack {

            // 🌌 BACKGROUND IMAGE
            Image("splash_bg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // ✨ CONTENT
            VStack(spacing: 16) {

                Spacer()

                Text("MILA")
                    .font(.system(size: 44, weight: .heavy))
                    .foregroundColor(.white)

                Text("Where stories come alive ✨")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.9))

                Spacer()

                Text("✨ Tap anywhere to start ✨")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.85))
                    .padding(.bottom, 40)
            }
        }
        .onTapGesture {
            goNext = true
        }
        .fullScreenCover(isPresented: $goNext) {
            AuthGateView()
        }
    }
}

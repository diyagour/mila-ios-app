import SwiftUI

struct SpaceBackground: View {
    var body: some View {
        Image("space_bg")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .overlay(
                // 🔥 THIS IS THE MAGIC
                Color.black.opacity(0.35)
                    .ignoresSafeArea()
            )
    }
}

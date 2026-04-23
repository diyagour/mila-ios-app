import SwiftUI

struct GlassCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    // 👇 DARKER glass layer
                    .fill(
                        Color.black
                            .opacity(0.35)   // 🔥 THIS is the key
                    )
                    .blur(radius: 0.3)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        Color.white.opacity(0.25),
                        lineWidth: 1
                    )
            )
    }
}

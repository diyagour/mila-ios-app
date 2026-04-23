import SwiftUI

struct GlowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .cyan.opacity(0.4), radius: 8)
            .shadow(color: .cyan.opacity(0.2), radius: 16)
    }
}

extension View {
    func glow() -> some View {
        self.modifier(GlowModifier())
    }
}

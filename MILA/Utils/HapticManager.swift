import UIKit

class HapticManager {
    static let shared = HapticManager()
    private let generator = UIImpactFeedbackGenerator(style: .light)

    func pageFlip() {
        generator.impactOccurred()
    }
}

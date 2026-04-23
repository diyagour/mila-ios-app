import SwiftUI

class StoryMagicStore: ObservableObject {
    @Published var magics: [StoryMagic] = []

    func add(_ magic: StoryMagic) {
        magics.insert(magic, at: 0)
    }
}

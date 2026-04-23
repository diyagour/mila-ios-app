import SwiftUI

final class StoryStore: ObservableObject {

    @Published var stories: [Story]

    init() {
        self.stories = SampleStories.all
    }

    func add(_ story: Story) {
        stories.insert(story, at: 0)
    }
}

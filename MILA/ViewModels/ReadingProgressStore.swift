import SwiftUI

final class ReadingProgressStore: ObservableObject {

    // storyId → lastReadPage
    @Published private var progress: [UUID: Int] = [:]

    // storyId → completed
    @Published private var completed: Set<UUID> = []

    // MARK: - Reading updates
    func updateProgress(story: Story, page: Int) {
        progress[story.id] = page

        if page >= story.pages.count - 1 {
            completed.insert(story.id)
        }
    }

    // MARK: - Progress helpers
    func progressFraction(for story: Story) -> Double {
        let page = progress[story.id] ?? 0
        guard story.pages.count > 0 else { return 0 }
        return Double(page) / Double(story.pages.count)
    }

    func pagesRead(for story: Story) -> Int {
        progress[story.id] ?? 0
    }

    // MARK: - Stats
    var pagesRead: Int {
        progress.values.reduce(0, +)
    }

    var booksCompleted: Int {
        completed.count
    }

    var readingMinutes: Int {
        // avg reading speed: 1 page = 2 minutes
        pagesRead * 2
    }
}


import SwiftUI

final class CreateStoryViewModel: ObservableObject {
    
    // Step
    @Published var step: Int = 1
    
    // Story info
    @Published var title: String = ""
    @Published var author: String = ""
    @Published var description: String = ""
    @Published var category: StoryCategory = .fantasy
    
    // Cover
    @Published var coverColor: Color = .blue
    @Published var icon: String = "book.closed.fill"
    
    // Pages
    @Published var pages: [String] = [""]
    
    func nextStep() {
        if step < 3 { step += 1 }
    }
    
    func previousStep() {
        if step > 1 { step -= 1 }
    }
    
    func addPage() {
        pages.append("")
    }
    
    func buildStory() -> Story {
        Story(
            title: title,
            author: author,
            category: category,
            coverColor: coverColor,
            icon: icon,
            pages: pages.map { StoryPage(text: $0) }
        )
    }
    func reset() {
        step = 1
        title = ""
        author = ""
        description = ""
        category = .fantasy
        pages = [""]
    }
}

import SwiftUI

struct Story: Identifiable, Hashable {
    let id: UUID
    let title: String
    let author: String
    let category: StoryCategory
    let coverColor: Color
    let icon: String
    let pages: [StoryPage]

    init(
        id: UUID = UUID(),
        title: String,
        author: String,
        category: StoryCategory,
        coverColor: Color,
        icon: String,
        pages: [StoryPage]
    ) {
        self.id = id
        self.title = title
        self.author = author
        self.category = category
        self.coverColor = coverColor
        self.icon = icon
        self.pages = pages
    }
}



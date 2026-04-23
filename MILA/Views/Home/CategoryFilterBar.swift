import SwiftUI

struct CategoryFilterBar: View {

    let selected: StoryCategory
    let onSelect: (StoryCategory) -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(StoryCategory.allCases) { category in
                    Text(category.title)
                        .font(.subheadline)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(
                            category == selected
                            ? Color.cyan.opacity(0.25)
                            : Color.white.opacity(0.08)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(14)
                        .onTapGesture {
                            onSelect(category)
                        }
                }
            }
            .padding(.vertical, 4)
        }
    }
}

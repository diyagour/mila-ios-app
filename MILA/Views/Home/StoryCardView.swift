import SwiftUI

struct StoryCardView: View {
    let story: Story

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            ZStack {
                LinearGradient(
                    colors: [
                        story.coverColor,
                        story.coverColor.opacity(0.7)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .cornerRadius(20)

                Image(systemName: story.icon)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .frame(height: 150)

            Text(story.title)
                .font(.headline)
                .foregroundColor(.white)
                .lineLimit(2)
        }
    }
}

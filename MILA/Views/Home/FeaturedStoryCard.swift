import SwiftUI

struct FeaturedStoryCard: View {
    let story: Story

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(
                colors: [
                    story.coverColor,
                    story.coverColor.opacity(0.7)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .cornerRadius(24)

            VStack(alignment: .leading, spacing: 12) {
                Text("FEATURED")
                    .font(.caption)
                    .padding(6)
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(12)

                Spacer()

                Text(story.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text(story.author)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
        }
        .frame(height: 220)
    }
}

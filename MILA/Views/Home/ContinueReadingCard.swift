import SwiftUI

struct ContinueReadingCard: View {

    let story: Story
    let progress: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            ZStack(alignment: .bottom) {
                LinearGradient(
                    colors: [
                        story.coverColor,
                        story.coverColor.opacity(0.7)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .cornerRadius(20)

                ProgressView(value: progress)
                    .tint(.cyan)
                    .padding()
            }
            .frame(height: 120)

            GlassCard {
                VStack(alignment: .leading, spacing: 4) {
                    Text(story.title)
                        .foregroundColor(.white)
                        .font(.headline)

                    Text("\(Int(progress * 100))% completed")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
            }
        }
    }
}

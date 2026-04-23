import SwiftUI

struct StoryPageView: View {
    let text: String
    let pageNumber: Int

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Page \(pageNumber)")
                    .font(.caption)
                    .foregroundColor(.gray)

                Text(text)
                    .font(.body)
                    .foregroundColor(.white)
            }
            .padding()
        }
    }
}


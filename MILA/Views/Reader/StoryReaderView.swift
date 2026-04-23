import SwiftUI

struct StoryReaderView: View {

    let story: Story

    @EnvironmentObject var progressStore: ReadingProgressStore
    @State private var currentPage: Int = 0

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(story.pages.indices, id: \.self) { index in
                    StoryPageView(
                        text: story.pages[index].text,
                        pageNumber: index + 1
                    )
                        .tag(index)
                }
            }
            .tabViewStyle(.page)
        }
        .background(Color.black.ignoresSafeArea())
        .onAppear {
            currentPage = progressStore.pagesRead(for: story)
        }
        .onChange(of: currentPage) { newValue in
            progressStore.updateProgress(story: story, page: newValue)
        }
    }
}

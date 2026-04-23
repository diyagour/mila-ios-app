import SwiftUI

struct LibraryView: View {

    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var storyStore: StoryStore
    @EnvironmentObject var progressStore: ReadingProgressStore

    @State private var selectedCategory: StoryCategory = .all
    @State private var selectedStory: Story?

    var filteredStories: [Story] {
        selectedCategory == .all
        ? storyStore.stories
        : storyStore.stories.filter { $0.category == selectedCategory }
    }

    var continueReading: [Story] {
        filteredStories.filter {
            let progress = progressStore.progressFraction(for: $0)
            return progress > 0 && progress < 1
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                SpaceBackground()   // 🌌 NEW BACKGROUND

                ScrollView {
                    VStack(alignment: .leading, spacing: 28) {

                        // Header
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Library")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)

                            Text("Welcome back,")
                                .foregroundColor(.gray)

                            Text(authVM.currentUser?.name ?? "")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                        }

                        // Continue Reading
                        if !continueReading.isEmpty {
                            Text("Continue Reading")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(continueReading) { story in
                                        ContinueReadingCard(
                                            story: story,
                                            progress: progressStore.progressFraction(for: story)
                                        )
                                        .onTapGesture {
                                            selectedStory = story
                                        }
                                    }
                                }
                            }
                        }

                        // Categories
                        CategoryFilterBar(
                            selected: selectedCategory,
                            onSelect: { selectedCategory = $0 }
                        )

                        // Stories
                        Text("Stories")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)

                        LazyVGrid(
                            columns: [GridItem(.flexible()), GridItem(.flexible())],
                            spacing: 20
                        ) {
                            ForEach(filteredStories) { story in
                                StoryCardView(story: story)
                                    .onTapGesture {
                                        selectedStory = story
                                    }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationDestination(item: $selectedStory) { story in
                StoryReaderView(story: story)
            }
        }
    }
}


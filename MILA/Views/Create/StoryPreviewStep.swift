import SwiftUI

struct StoryPreviewStep: View {

    @ObservedObject var vm: CreateStoryViewModel
    @EnvironmentObject var storyStore: StoryStore

    let onPublish: () -> Void

    var body: some View {
        VStack(spacing: 16) {

            Text("Preview")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)

            GlassCard {
                VStack(alignment: .leading, spacing: 6) {
                    Text(vm.title)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)

                    Text("by \(vm.author)")
                        .foregroundColor(.gray)
                }
            }

            ScrollView {
                VStack(spacing: 14) {
                    ForEach(vm.pages.indices, id: \.self) { i in
                        GlassCard {
                            Text(vm.pages[i])
                                .foregroundColor(.white)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
            }

            Button {
                let story = vm.buildStory()
                storyStore.add(story)
                onPublish()
            } label: {
                Text("Publish Story")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.cyan)
                    .foregroundColor(.black)
                    .cornerRadius(14)
            }
        }
        .padding()
    }
}

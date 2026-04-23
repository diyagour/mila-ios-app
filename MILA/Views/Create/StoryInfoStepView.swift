import SwiftUI

struct StoryInfoStepView: View {

    @ObservedObject var vm: CreateStoryViewModel

    var body: some View {
        VStack(spacing: 20) {

            Text("Create Story")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)

            Text("Tell your story")
                .foregroundColor(.white.opacity(0.8))

            GlassCard {
                VStack(spacing: 16) {

                    // TITLE
                    ZStack(alignment: .leading) {
                        if vm.title.isEmpty {
                            Text("Title")
                                .foregroundColor(.white.opacity(0.6))
                        }
                        TextField("", text: $vm.title)
                            .foregroundColor(.white)
                    }

                    // AUTHOR
                    ZStack(alignment: .leading) {
                        if vm.author.isEmpty {
                            Text("Author")
                                .foregroundColor(.white.opacity(0.6))
                        }
                        TextField("", text: $vm.author)
                            .foregroundColor(.white)
                    }

                    // DESCRIPTION
                    ZStack(alignment: .topLeading) {
                        if vm.description.isEmpty {
                            Text("Story description")
                                .foregroundColor(.white.opacity(0.6))
                                .padding(.top, 8)
                        }
                        TextEditor(text: $vm.description)
                            .frame(height: 120)
                            .foregroundColor(.white)
                            .scrollContentBackground(.hidden)
                    }
                }
            }

            Button {
                vm.nextStep()
            } label: {
                Text("Next →")
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

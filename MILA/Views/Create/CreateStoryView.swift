import SwiftUI

struct CreateStoryView: View {

    @ObservedObject var vm: CreateStoryViewModel

    var body: some View {
        ZStack {
            SpaceBackground()

            VStack(spacing: 20) {

                Text("Create Story")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                Text("Tell your story")
                    .foregroundColor(.white.opacity(0.85))

                VStack(alignment: .leading, spacing: 14) {

                    // TITLE
                    Text("Story Title")
                        .foregroundColor(.white)
                        .font(.caption)

                    TextField("", text: $vm.title)
                        .padding()
                        .background(Color.white.opacity(0.18))
                        .foregroundColor(.white)
                        .cornerRadius(12)

                    // AUTHOR
                    Text("Author Name")
                        .foregroundColor(.white)
                        .font(.caption)

                    TextField("", text: $vm.author)
                        .padding()
                        .background(Color.white.opacity(0.18))
                        .foregroundColor(.white)
                        .cornerRadius(12)

                    // DESCRIPTION
                    Text("Story Description")
                        .foregroundColor(.white)
                        .font(.caption)

                    TextEditor(text: $vm.description)
                        .frame(height: 120)
                        .padding()
                        .background(Color.white.opacity(0.18))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .scrollContentBackground(.hidden)
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
}

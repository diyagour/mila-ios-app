import SwiftUI

struct StoryPagesStep: View {

    @ObservedObject var vm: CreateStoryViewModel

    var body: some View {
        VStack(spacing: 20) {

            Text("Story Pages")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)

            ScrollView {
                VStack(spacing: 16) {
                    ForEach(vm.pages.indices, id: \.self) { index in
                        GlassCard {
                            TextEditor(text: $vm.pages[index])
                                .foregroundColor(.white)
                                .scrollContentBackground(.hidden)
                                .background(Color.clear) // 🔥 IMPORTANT
                                .frame(height: 120)
                        }
                    }
                }
            }

            Button("Add Page") {
                vm.addPage()
            }
            .foregroundColor(.cyan)

            HStack {
                Button("Back") {
                    vm.previousStep()
                }
                .foregroundColor(.white)

                Spacer()

                Button("Next →") {
                    vm.nextStep()
                }
                .foregroundColor(.cyan)
            }
        }
        .padding()
    }
}


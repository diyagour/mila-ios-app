import SwiftUI

struct CreateStoryFlowView: View {

    @StateObject private var vm = CreateStoryViewModel()

    var body: some View {
        ZStack {
            SpaceBackground()

            VStack {
                StepIndicator(step: vm.step)
                    .padding(.top)

                switch vm.step {

                case 1:
                    CreateStoryView(vm: vm)

                case 2:
                    StoryPagesStep(vm: vm)

                case 3:
                    StoryPreviewStep(
                        vm: vm,
                        onPublish: {
                            vm.reset()
                        }
                    )

                default:
                    EmptyView()
                }
            }
        }
    }
}

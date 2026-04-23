import SwiftUI

struct StepIndicator: View {
    let step: Int

    var body: some View {
        HStack {
            ForEach(1...3, id: \.self) { i in
                Circle()
                    .fill(step >= i ? Color.blue : Color.gray)
                    .frame(width: 12, height: 12)
            }
        }
    }
}

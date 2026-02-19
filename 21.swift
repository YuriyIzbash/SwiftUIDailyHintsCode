// ❌ The architectural identity crisis
final class CounterViewModel: ObservableObject {
    @State var count = 0 // 🚨 Wrong universe

    func increment() {
        count += 1
    }
}

struct CounterView: View {
    @StateObject private var viewModel = CounterViewModel()

    var body: some View {
        VStack {
            Text("Count: \(viewModel.count)") // Won’t update properly
            Button("Increment") {
                viewModel.increment()
            }
        }
    }
}

// ✅ Roles clearly separated
final class CounterViewModel: ObservableObject {
    @Published var count = 0

    func increment() {
        count += 1
    }
}

struct CounterView: View {
    @StateObject private var viewModel = CounterViewModel()

    var body: some View {
        VStack {
            Text("Count: \(viewModel.count)")
            Button("Increment") {
                viewModel.increment()
            }
        }
    }
}

// 🧠 SwiftUI hierarchy rule:
// Views hold @State.
// ViewModels publish changes.


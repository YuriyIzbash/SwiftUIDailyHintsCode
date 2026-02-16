// ❌ The innocent-looking villain
struct TinyView: View {
    var body: some View {
        Text("Result: \(expensiveCalculation())")
    }

    func expensiveCalculation() -> Int {
        print("Calculating... 🧠🔥")
        return (0...10_000).reduce(0, +) // Pretend this is VERY heavy
    }
}

// Used inside a scrolling list… because why not
struct ContentView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<50) { _ in
                TinyView() // 🫠 CPU has left the chat
            }
        }
    }
}

// ✅ Move heavy work out of body
final class TinyViewModel: ObservableObject {
    let result: Int

    init() {
        print("Calculated once ✅")
        result = (0...10_000).reduce(0, +)
    }
}

struct TinyView: View {
    @StateObject private var viewModel = TinyViewModel()

    var body: some View {
        Text("Result: \(viewModel.result)")
    }
}

// 🧠 SwiftUI performance wisdom:
// Small views are fine.
// Expensive bodies are not.


// ❌ The "why is my data resetting?" tragedy
struct TimerView: View {
    @ObservedObject var timer = TimerViewModel()

    var body: some View {
        Text("Seconds: \(timer.seconds)")
    }
}

final class TimerViewModel: ObservableObject {
    @Published var seconds = 0

    init() {
        print("TimerViewModel created ⏱️")
    }
}

// ✅ The ownership-aware solution
struct TimerView: View {
    @StateObject private var timer = TimerViewModel()

    var body: some View {
        Text("Seconds: \(timer.seconds)")
    }
}

// 🧠 Ownership rules:
// You create it → @StateObject
// You receive it → @ObservedObject

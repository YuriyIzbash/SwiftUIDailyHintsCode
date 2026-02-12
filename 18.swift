// ❌ The silent assassination
final class MissionViewModel: ObservableObject {
    @Published var status = "Waiting..."

    func startMission() {
        Task {
            // Background work
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            status = "Target eliminated 💼" // 💀 Updated off MainActor
        }
    }
}

// ✅ Licensed to update UI
@MainActor
final class MissionViewModel: ObservableObject {
    @Published var status = "Waiting..."

    func startMission() {
        Task {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            status = "Target eliminated 💼" // Safe and predictable
        }
    }
}

struct MissionView: View {
    @StateObject private var viewModel = MissionViewModel()

    var body: some View {
        VStack {
            Text(viewModel.status)
            Button("Start Mission") {
                viewModel.startMission()
            }
        }
    }
}

// 🧠 Concurrency rule:
// UI state + background thread = silent chaos.
// UI state + MainActor = clean execution.


// ❌ The "works on my device" architecture
struct DashboardView: View {
    @EnvironmentObject var session: UserSession

    var body: some View {
        Text("Welcome, \(session.username)")
    }
}

// Preview crashes 💥 because no UserSession was injected
#Preview {
    DashboardView()
}

// ✅ Preview-friendly, dependency-aware design
struct DashboardView: View {
    @ObservedObject var session: UserSession

    var body: some View {
        Text("Welcome, \(session.username)")
    }
}

#Preview {
    DashboardView(session: UserSession.mock)
}

// Mock for previews & testing
final class UserSession: ObservableObject {
    @Published var username: String

    init(username: String) {
        self.username = username
    }

    static var mock: UserSession {
        UserSession(username: "PreviewUser 👩‍🔬")
    }
}

// 🧠 Preview rule:
// If Preview crashes,
// your architecture is talking to you.

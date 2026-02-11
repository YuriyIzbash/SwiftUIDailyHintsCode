// ❌ The "grandpa paradox" navigation
struct TimeTravelView: View {
    @State private var path = [String]()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Visit 1985") {
                    goTo1985() // Mystery navigation attempt
                }
            }
            .navigationDestination(for: String.self) { year in
                Text("Welcome to \(year)")
            }
        }
    }

    func goTo1985() {
        // Pretending we can "push" without changing state
        print("Trying to time travel… but nothing happens")
    }
}

// ✅ The state-machine approach
struct TimeTravelView: View {
    @State private var path = [String]()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Visit 1985") {
                    path.append("1985") // 🕰️ Timeline updated
                }

                Button("Erase 1985 (Grandpa Paradox)") {
                    path.removeAll() // Timeline rewritten
                }
            }
            .navigationDestination(for: String.self) { year in
                Text("Welcome to \(year)")
            }
        }
    }
}

// 🧠 SwiftUI navigation rule:
// The stack doesn’t move you.
// Your state does.

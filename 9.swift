// ❌ The "but the print works!" confusion
struct CounterView: View {
    var count = 0

    var body: some View {
        Button("Count: \(count)") {
            count += 1
            print("Count is now \(count)") // UI: 😐
        }
    }
}

// ✅ The SwiftUI-approved way
struct CounterView: View {
    @State private var count = 0

    var body: some View {
        Button("Count: \(count)") {
            count += 1 // UI: 🎉
        }
    }
}

// 🧠 SwiftUI rule:
// Mutate observed state,
// or enjoy your unchanged UI.

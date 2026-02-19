// Meet Gizmo 🐣
struct GremlinFactoryView: View {
    var body: some View {
        let gizmo = Text("Gizmo")

        // ❌ You think you're modifying Gizmo...
        gizmo
        gizmo.foregroundColor(.green) // New Gremlin #1
        gizmo.bold()                  // New Gremlin #2

        // Original Gizmo? Still unchanged.
    }
}

// ✅ Each modifier creates a new wrapped view
struct GremlinFactoryView: View {
    var body: some View {
        Text("Gizmo")
            .foregroundColor(.green)   // Gremlin #1
            .bold()                    // Gremlin #2
            .padding()                 // Gremlin #3
            .background(Color.yellow)  // Gremlin #4
    }
}

// Modifier order = different species 👇

Text("Midnight Snack")
    .background(Color.red)
    .padding()   // Padding wraps background

Text("Midnight Snack")
    .padding()
    .background(Color.red) // Background wraps padding

// 🧠 SwiftUI rule:
// Modifiers don’t mutate the original.
// They multiply.


// ❌ The instant-death animation
struct GhostView: View {
    @State private var isVisible = false

    var body: some View {
        Text("👻 Boo!")
            .opacity(isVisible ? 1 : 0)
            .animation(.easeInOut, value: isVisible)
            .onAppear {
                isVisible = true // Changed before SwiftUI could animate
            }
    }
}

// ✅ The jump-scare that actually animates
struct GhostView: View {
    @State private var isVisible = false

    var body: some View {
        Text("👻 Boo!")
            .opacity(isVisible ? 1 : 0)
            .onAppear {
                withAnimation(.easeInOut) {
                    isVisible = true
                }
            }
    }
}

// 🧠 Animation rule:
// Change state at the right time,
// or enjoy your non-animated jump cut.

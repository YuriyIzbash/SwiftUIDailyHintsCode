// ❌ The "why is this called 47 times?" panic
struct CoffeeView: View {
    var body: some View {
        print("Rebuilding CoffeeView ☕️") // Anxiety generator

        return Text("Coffee Time")
    }
}

// ✅ The SwiftUI way: views are cheap, logic is elsewhere
struct CoffeeView: View {
    var body: some View {
        Text("Coffee Time")
    }
}

final class CoffeeViewModel: ObservableObject {
    init() {
        print("ViewModel created once ☕️")
    }
}

// 🧠 Moral of the story:
// Views rebuild constantly.
// ViewModels should not.

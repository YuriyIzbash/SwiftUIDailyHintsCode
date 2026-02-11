// ❌ The wishful thinking approach
struct CheckoutView: View {
    @State private var totalPrice = 0

    var body: some View {
        Button("Add Item") {
            totalPrice += 10
        }
        .onAppear {
            print("Total:", totalPrice) // Surprise reset incoming
        }
    }
}

// ✅ The adult-in-the-room approach
final class CartViewModel: ObservableObject {
    @Published var totalPrice = 0
}

struct CheckoutView: View {
    @StateObject private var viewModel = CartViewModel()

    var body: some View {
        Button("Add Item") {
            viewModel.totalPrice += 10
        }
    }
}

// 🧠 Rule of life:
// UI state → @State
// App state → ViewModel

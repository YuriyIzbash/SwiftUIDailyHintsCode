// ❌ The "keeping everything in sync" nightmare
struct CheckoutView: View {
    @State private var quantity = 1
    @State private var totalPrice = 10 // Derived 😬

    var body: some View {
        Stepper("Qty: \(quantity)", value: $quantity)
        Button("Recalculate") {
            totalPrice = quantity * 10 // Manual syncing
        }
        Text("Total: $\(totalPrice)")
    }
}

// ✅ Let SwiftUI do the math
struct CheckoutView: View {
    @State private var quantity = 1

    var totalPrice: Int {
        quantity * 10
    }

    var body: some View {
        Stepper("Qty: \(quantity)", value: $quantity)
        Text("Total: $\(totalPrice)")
    }
}

// 🧠 SwiftUI wisdom:
// Store the source.
// Derive the rest.

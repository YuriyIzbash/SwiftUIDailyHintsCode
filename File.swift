import SwiftUI

// The ViewModel (the apartment)
final class CounterViewModel: ObservableObject {
    @Published var count = 0
}

// ❌ WRONG: The tenant buys a new apartment every time they enter the room.
struct TenantView_Wrong: View {
    @ObservedObject var viewModel = CounterViewModel() // resets on redraw

    var body: some View {
        VStack(spacing: 16) {
            Text("Count: \(viewModel.count)")
            Button("Increase Rent 💸") {
                viewModel.count += 1
            }
        }
        .padding()
    }
}

// ✅ RIGHT: The landlord owns the apartment.
struct LandlordView: View {
    @StateObject private var viewModel = CounterViewModel() // owned here

    var body: some View {
        TenantView_Right(viewModel: viewModel)
    }
}

// The tenant just rents it.
struct TenantView_Right: View {
    @ObservedObject var viewModel: CounterViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text("Count: \(viewModel.count)")
            Button("Increase Rent 💸") {
                viewModel.count += 1
            }
        }
        .padding()
    }
}

// ❌ The optimistic assumption
struct ProfileView: View {
    @State private var loadCount = 0

    var body: some View {
        Text("Profile loaded \(loadCount)x")
            .onAppear {
                loadCount += 1
                fetchProfile() // Surprise: multiple API calls
            }
    }
}

// ✅ The intentional approach
struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        Text("Profile loaded")
            .onAppear {
                viewModel.loadIfNeeded()
            }
    }
}

final class ProfileViewModel: ObservableObject {
    private var hasLoaded = false

    func loadIfNeeded() {
        guard !hasLoaded else { return }
        hasLoaded = true
        fetchProfile()
    }
}

// 🧠 Remember:
// Views appear often.
// Side effects should not.

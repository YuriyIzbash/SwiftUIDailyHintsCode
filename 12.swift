// ❌ The "why is this loading again?" horror
struct NewsView: View {
    var body: some View {
        fetchLatestNews() // 😱 called repeatedly
        return Text("Top Stories")
    }
}

// ✅ The clean, guilt-free approach
struct NewsView: View {
    @StateObject private var viewModel = NewsViewModel()

    var body: some View {
        Text("Top Stories")
            .onAppear {
                viewModel.loadIfNeeded()
            }
    }
}

final class NewsViewModel: ObservableObject {
    private var hasLoaded = false

    func loadIfNeeded() {
        guard !hasLoaded else { return }
        hasLoaded = true
        fetchLatestNews()
    }
}

// 🧠 SwiftUI hygiene:
// body = pure
// effects = elsewhere

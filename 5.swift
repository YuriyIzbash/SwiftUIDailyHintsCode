// ❌ The shared-mutable-chaos approach
final class Settings {
    var darkModeEnabled = false
}

struct SettingsView: View {
    let settings: Settings

    var body: some View {
        Toggle("Dark Mode", isOn: $settings.darkModeEnabled) // 😬
    }
}

// ✅ The SwiftUI-approved approach
struct Settings {
    var darkModeEnabled = false
}

final class SettingsViewModel: ObservableObject {
    @Published var settings = Settings()
}

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel

    var body: some View {
        Toggle(
            "Dark Mode",
            isOn: $viewModel.settings.darkModeEnabled
        )
    }
}

// 🧠 SwiftUI mantra:
// Value types for data.
// Reference types for ownership.

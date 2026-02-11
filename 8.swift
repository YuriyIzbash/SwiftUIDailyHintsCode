// ❌ The "why is this called constantly?" mystery
struct WeatherView: View {
    var temperatureText: String {
        fetchWeatherFromServer() // 😱 side effect
        return "22°C"
    }

    var body: some View {
        Text(temperatureText)
    }
}

// ✅ The SwiftUI-friendly approach
final class WeatherViewModel: ObservableObject {
    @Published var temperatureText = "—"

    func loadWeather() {
        temperatureText = "22°C"
    }
}

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()

    var body: some View {
        Text(viewModel.temperatureText)
            .onAppear {
                viewModel.loadWeather()
            }
    }
}

// 🧠 Rule of sanity:
// Computed properties compute.
// Effects belong elsewhere.

// ❌ The accidental fairy tale subscription
struct KingdomView: View {
    @State private var apples = 1
    @State private var dragonMood = "Sleepy"

    var body: some View {
        VStack {
            MirrorView(apples: apples) // 👀 Subscribed
            Text("Dragon is \(dragonMood)") // 👀 Also subscribed

            Button("Feed Apple") {
                apples += 1
            }

            Button("Wake Dragon") {
                dragonMood = "Angry 🔥"
            }
        }
    }
}

struct MirrorView: View {
    let apples: Int

    var body: some View {
        print("Mirror re-rendered 🪞")
        return Text("Apples in basket: \(apples)")
    }
}

// 🧠 Fairy tale law of SwiftUI:
// If your view looks into the state,
// it will reflect every change.

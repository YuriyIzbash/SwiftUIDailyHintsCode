// ❌ The "anyone can be Spider-Man now" mistake
struct ProfileView: View {
    @State private var username = "Peter Parker"

    var body: some View {
        UsernameLabel(username: $username) // Power granted
    }
}

struct UsernameLabel: View {
    @Binding var username: String

    var body: some View {
        Text(username)
            .onTapGesture {
                username = "Venom 😈" // Absolute power, instantly abused
            }
    }
}

// ✅ Power given only when deserved
struct ProfileView: View {
    @State private var username = "Peter Parker"

    var body: some View {
        UsernameLabel(username: username)
    }
}

struct UsernameLabel: View {
    let username: String

    var body: some View {
        Text(username)
    }
}

// 🧠 Uncle Ben’s Law of SwiftUI:
// With great Binding power,
// comes great responsibility.

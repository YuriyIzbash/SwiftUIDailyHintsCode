// ❌ The dangerous way: surprise dependency
struct ProfileView: View {
    @EnvironmentObject var userSession: UserSession

    var body: some View {
        Text("Hello, \(userSession.username)")
    }
}

// Somewhere else… maybe
ProfileView() // 💥 Crash if UserSession wasn't injected


// ✅ The safer way: explicit and boring (in a good way)
struct ProfileView: View {
    @ObservedObject var userSession: UserSession

    var body: some View {
        Text("Hello, \(userSession.username)")
    }
}

// Caller is forced to be responsible
ProfileView(userSession: UserSession())

// 🧠 Use EnvironmentObject only for things like:
// app settings, themes, authentication state

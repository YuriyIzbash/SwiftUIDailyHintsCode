// ❌ The "everyone is the same person" situation
struct User {
    let name: String
}

struct UserListView: View {
    let users = [
        User(name: "Alice"),
        User(name: "Bob"),
        User(name: "Charlie")
    ]

    var body: some View {
        ForEach(users, id: \.name) { user in
            Text(user.name)
        }
    }
}

// ✅ The face-recognition-enabled approach
struct User: Identifiable {
    let id = UUID()
    let name: String
}

struct UserListView: View {
    let users = [
        User(name: "Alice"),
        User(name: "Bob"),
        User(name: "Charlie")
    ]

    var body: some View {
        ForEach(users) { user in
            Text(user.name)
        }
    }
}

// 🧠 SwiftUI needs IDs
// like humans need faces.

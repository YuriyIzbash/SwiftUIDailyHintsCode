// The brain 🧠
final class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""

    var isLoginEnabled: Bool {
        username.count >= 3 && password.count >= 6
    }

    func login() {
        print("Logging in as \(username)... 🚀")
    }
}

/// ❌ WRONG: The View is overthinking everything.
struct LoginView_Wrong: View {
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 16) {
            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            // The View doing business logic 😬
            Button("Login") {
                if username.count >= 3 && password.count >= 6 {
                    print("Logging in as \(username)... 🚀")
                }
            }
            .disabled(!(username.count >= 3 && password.count >= 6))
        }
        .padding()
    }
}

/// ✅ RIGHT: The View just shows. The ViewModel thinks.
struct LoginView_Right: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        VStack(spacing: 16) {
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)

            Button("Login") {
                viewModel.login()
            }
            .disabled(!viewModel.isLoginEnabled)
        }
        .padding()
    }
}

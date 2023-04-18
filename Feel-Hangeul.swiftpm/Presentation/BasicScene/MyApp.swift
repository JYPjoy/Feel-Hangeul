import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    OnboardingView()
                }
            } else {
                NavigationView {
                    OnboardingView()
                }
                .navigationViewStyle(.stack)
            }
        }
    }
}

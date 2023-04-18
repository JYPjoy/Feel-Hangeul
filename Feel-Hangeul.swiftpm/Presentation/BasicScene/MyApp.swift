import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                //MainView()
                OnboardingView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .accentColor(.blue)
     
        }
    }
}

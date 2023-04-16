import SwiftUI

@main
struct MyApp: App {
//    init(){
//        UINavigationBar.appearance().barTintColor = UIColor(.black)
//    }
//
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

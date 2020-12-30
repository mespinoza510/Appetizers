import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            DisplayOnboardingView()
                .environmentObject(order)
        }
    }
}

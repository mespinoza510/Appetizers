import SwiftUI
import Foundation

struct AppetizerTabView: View {
    
    var body: some View {
        
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: SFSymbols.house.rawValue)
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: SFSymbols.person.rawValue)
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: SFSymbols.bag.rawValue)
                    Text("Order")
                }
        }
        .accentColor(.brandPrimary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}

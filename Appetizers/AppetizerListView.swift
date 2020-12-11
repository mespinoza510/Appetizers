import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            Text("Appetizers")
                .navigationTitle("🍘 Appetizers")
        }
    }
}

struct ApptizersListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject private var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
                .navigationTitle("🍘 Appetizers")
        }
        .onAppear {
            self.viewModel.getAppetizers()
        }
    }
}

struct ApptizersListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}

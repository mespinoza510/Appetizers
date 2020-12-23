import SwiftUI

struct AppetizerListView: View {
    
    @EnvironmentObject var order: Order
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            self.viewModel.selectedAppetizer = appetizer
                            self.viewModel.isShowingDetailView = true
                        }
                }.overlay(
                    NavigationLink(destination: viewModel.orderView,
                                   isActive: $viewModel.isViewOrderButtonTapped) {
                        ViewOrderButton(isViewOrderButtonTapped: $viewModel.isViewOrderButtonTapped,
                                        itemNum: order.items.count)
                    }, alignment: .bottom)
                .navigationTitle("🍘 Appetizers")
                .disabled(viewModel.isShowingDetailView)
            }
            .onAppear {
                self.viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetailView ? 20: 0)
            
            if viewModel.isShowingDetailView {
                AppetizerDetailView(isShowingDetailView: $viewModel.isShowingDetailView, appetizer: viewModel.selectedAppetizer)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct ApptizersListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
            .environmentObject(Order())
    }
}

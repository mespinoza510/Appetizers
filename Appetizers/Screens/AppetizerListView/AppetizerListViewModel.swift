import Foundation

final class AppetizerListViewModel: ObservableObject {
        
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetailView = false
    @Published var selectedAppetizer: Appetizer = MockData.sampleAppetizer
    
    // `[self]` is used to avoid repeating in the switch statements
    func getAppetizers() {
        self.isLoading = true
        NetworkManager.shared.getAppetizers { [self] result in
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                    print(error.localizedDescription)
                }
            }
        }
    }
}

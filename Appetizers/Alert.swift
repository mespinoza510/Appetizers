import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidURL      = AlertItem(title: Text("Invalid URL"),
                                      message: Text("There was an issue connecting to server. If this persists, please contact support."),
                                      dismissButton: .default(Text("Ok")))
    
    static let invalidData     = AlertItem(title: Text("Server Error!"),
                                      message: Text("The data received from server was invalid. Please contact support"),
                                      dismissButton: .default(Text("Ok")))
    
    static let invalidResponse  = AlertItem(title: Text("Server Error!"),
                                      message: Text("Invalid response from server. Please try again later or contact support."),
                                      dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error!"),
                                      message: Text("Unable to complete request. Please check your connection or contact support if this persists."),
                                      dismissButton: .default(Text("Ok")))
}

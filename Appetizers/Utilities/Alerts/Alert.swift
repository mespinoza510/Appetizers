import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: - Network Alerts
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
    
    //MARK: - Account Alerts
    static let invalidForm      = AlertItem(title: Text("Invalid Form"),
                                            message: Text("There are one or more fields that have not been filled. Please go back and fill out form correctly."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidEmail     = AlertItem(title: Text("Invalid Email"),
                                            message: Text("Email is not in correct format. Please input a valid email."),
                                            dismissButton: .default(Text("Ok")))
    
    static let userSaveSuccess     = AlertItem(title: Text("Profile Saved!"),
                                            message: Text("Your profile information was successfully saved."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidUserData     = AlertItem(title: Text("Profile Error!"),
                                            message: Text("There was an error saving or retrieving your profile."),
                                            dismissButton: .default(Text("Ok")))
}

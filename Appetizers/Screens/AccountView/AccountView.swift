import SwiftUI

struct AccountView: View {
    
    @StateObject private var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    
                    HStack {
                        Image(systemName: SFSymbols.person.rawValue)
                            .foregroundColor(.gray)
                        
                        AppetizerTextField(placeHolder: "First Name",
                                           text: $viewModel.user.firstName,
                                           refresh: $viewModel.refresh)
                    }
            
                    HStack {
                        Image(systemName: SFSymbols.person.rawValue)
                            .foregroundColor(.gray)
                        
                        AppetizerTextField(placeHolder: "Last Name",
                                           text: $viewModel.user.lastName,
                                           refresh: $viewModel.refresh)
                    }
                    
                    HStack {
                        Image(systemName: SFSymbols.envelope.rawValue)
                            .foregroundColor(.gray)
                        
                        AppetizerTextField(placeHolder: "Email",
                                           text: $viewModel.user.email,
                                           refresh: $viewModel.refresh)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.secondary)
                        
                        DatePicker("Birthday",
                                   selection: $viewModel.user.birthDate,
                                   in: Date().oneHundredYearsAgo...Date().eighteenYearsAgo,
                                   displayedComponents: .date)
                    }
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                            .foregroundColor(.brandPrimary)
                    }
                }
                
                Section(header: Text("Requests ")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefill)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("👤 Account")
        }.animation(.none)
        .onAppear {
            self.viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .preferredColorScheme(.dark)
    }
}

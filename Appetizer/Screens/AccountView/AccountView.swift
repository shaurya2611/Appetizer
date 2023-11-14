//
//  AccountView.swift
//  Appetizer
//
//  Created by Shaurya Singh on 29/10/23.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()

    var body: some View {
        NavigationView{
            // Form contains Sections and section contains content, headre and footer
            Form{
                Section{ //content
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("Phone Number", text: $viewModel.phoneNumber)
                        .keyboardType(.phonePad)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    DatePicker("Birthday", selection: $viewModel.birthday, displayedComponents: .date)
                } header: {
                    Text("Personal Info").fontWeight(.medium)
                } footer: {
                    Text("All fields are maindatory to be filled")
                }
                
                Section{
                    Toggle("Include cutleries", isOn: $viewModel.includeCutleries)
                        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                    Toggle("Include napkins", isOn: $viewModel.includeNapkins)
                        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                     
                } header: {
                    Text("Request").fontWeight(.medium)
                } footer: {
                    Button{
                        viewModel.saveChanges()
                    }label: {
                        HStack{
                            Spacer()
                            APButton(buttonLabel: "Save").padding(.horizontal).padding(.top,10)
                            Spacer()
                        }
                        }
                    }
            }
            .navigationTitle("Account")
            
            }
        .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}

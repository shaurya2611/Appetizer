//
//  AccountViewModel.swift
//  Appetizer
//
//  Created by Shaurya Singh on 11/11/23.
//

import SwiftUI

final class AccountViewModel: ObservableObject{

    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var phoneNumber = ""
    @Published var birthday = Date()
    @Published var includeCutleries = false
    @Published var includeNapkins = false
    @Published var alertItem : AlertItem?
    
    var isValidForm: Bool{
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && !phoneNumber.isEmpty else{
            self.alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else{
            self.alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges(){
        guard isValidForm else{
            return
        }
        // if true save all chnages in DB
    }

}

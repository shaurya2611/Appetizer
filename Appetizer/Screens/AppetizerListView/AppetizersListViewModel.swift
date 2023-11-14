//
//  AppetizersListViewModel.swift
//  Appetizer
//
//  Created by Shaurya Singh on 08/11/23.
//

import SwiftUI
// All the files viewModel files are class not strcut as we donot want to recretae files in case of var changes
final class AppetizersListViewModel: ObservableObject{
    
    @Published var appetizers : [ Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetailView = false
    @Published var selectedAppetizer : Appetizer?
    
    func getAppetizers(){
        self.isLoading = true  // show laoding view as soon as network call is made
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {// DispactQueue used to made network call in main thread
                self.isLoading = false //loading view in false, as soon we get result either true or false
                switch result{
                case .success(let appetizerResponseList):
                    self.appetizers = appetizerResponseList
                    
                case .failure(let error):
                    switch error{
                        
                    case .inValidURL:
                        self.alertItem = AlertContext.ivalidURL
                    case .inValidResponse:
                        self.alertItem = AlertContext.ivalidResponse
                    case .inValidData:
                        self.alertItem = AlertContext.ivalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
            
        }
    }
}



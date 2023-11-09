//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Shaurya Singh on 29/10/23.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizersListViewModel()
    @State private var isShowingDetailView = false
    @State private var selectedAppetizer : Appetizer?

    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers){appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            selectedAppetizer = appetizer
                            isShowingDetailView = true
                        }
                    
                }
                // disable appied to view will make it unintractable
                .disabled(isShowingDetailView)
                .navigationTitle("Appetizers 🍝")
                .navigationBarTitleDisplayMode(.large)
            }.onAppear(){
                viewModel.getAppetizers()
            }
            // make appetizerListView blur when isShowingDetailView is TRUE
            .blur(radius: isShowingDetailView ? 20 : 0)
            
            
            
            
            // on tap resent detail view
            if isShowingDetailView{
                AppetizerDetails(isShowingDetailView: $isShowingDetailView,
                                 appetizer: selectedAppetizer!)
            }
            
            // presenting loading view
            if viewModel.isLoading{
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

//#Preview {
//    AppetizerListView( selectedAppetizer: MockData.sampleAppetizer)
//}





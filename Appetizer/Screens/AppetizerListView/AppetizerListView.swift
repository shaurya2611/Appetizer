//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Shaurya Singh on 29/10/23.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizersListViewModel()
/*    @State private var isShowingDetailView = false
      @State private var selectedAppetizer : Appetizer?
     For code refactoring purpose moved above @State varibales in viewModel file and marked @Published
      @Published var isShowingDetailView = false // published like whoever is listening to this varibale
      @Published var selectedAppetizer : Appetizer?   */

    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers){appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetailView = true
                        }
                    
                }
                // disable appied to view will make it unintractable
                .disabled(viewModel.isShowingDetailView)
                .navigationTitle("Appetizers 🍝")
                .navigationBarTitleDisplayMode(.large)
            }.onAppear(){
                viewModel.getAppetizers()
            }
            // make appetizerListView blur when isShowingDetailView is TRUE
            .blur(radius: viewModel.isShowingDetailView ? 20 : 0)
            
            
            // on tap show detail view
            if viewModel.isShowingDetailView{
                AppetizerDetails(isShowingDetailView: $viewModel.isShowingDetailView,
                                 appetizer: viewModel.selectedAppetizer!)
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





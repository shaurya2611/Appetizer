//
//  ContentView.swift
//  Appetizer
//
//  Created by Shaurya Singh on 29/10/23.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        
        // tabView: used to provide tab panel at bottom of screen
        TabView{
            // each tabItem is associated with the respective view to be shown when that tab option in pressed
            AppetizerListView()
                .tabItem {  Image(systemName: "house")
                            Text("Account") }
            AccountView()
                .tabItem {  Image(systemName: "person")
                            Text("Account") }
            OrderView()
                .tabItem {  Image(systemName: "bag")
                            Text("Order") }
        }
        // accentColor: used to change the theme color for tab (blue by default)
        .accentColor(Color.brandPrimary)
        
    }
}

#Preview {
    AppetizerTabView()
}

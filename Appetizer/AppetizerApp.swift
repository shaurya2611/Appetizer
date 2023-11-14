//
//  AppetizerApp.swift
//  Appetizer
//
//  Created by Shaurya Singh on 29/10/23.
//

import SwiftUI

@main
struct AppetizerApp: App {
    
    var orderEnvObject = Order() // Order objetc has property -> list of appetizers
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(orderEnvObject) // all the child views of appetizertab view will have access to order boject
        }
    }
}

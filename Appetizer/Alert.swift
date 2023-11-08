//
//  Alert.swift
//  Appetizer
//
//  Created by Shaurya Singh on 08/11/23.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext{
    
    static let ivalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("Data received from the server was invalid, Please contact support"),
                                       dismissButton: .default(Text("OK")))
    
    static let ivalidURL = AlertItem(title: Text("Server Error"),
                                       message: Text("Ivalid URL,  Please contact support"),
                                       dismissButton: .default(Text("OK")))
    
    static let ivalidResponse = AlertItem(title: Text("Server Error"),
                                       message: Text("Inalid response from server, Please contact support"),
                                       dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                       message: Text("Unable to complete request this time, check internet"),
                                       dismissButton: .default(Text("OK")))
}

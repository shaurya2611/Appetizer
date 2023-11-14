//
//  Order.swift
//  Appetizer
//
//  Created by Shaurya Singh on 14/11/23.
//

import SwiftUI

final class Order: ObservableObject{
    // these are the list of the order a user ahs selected, so these has to be passed to order view and also other view i.e. has to be availble globally. Hence its passed in environment object
    @Published var items : [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) {$0 + $1.price}
    }
}

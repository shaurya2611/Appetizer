//
//  OrderView.swift
//  Appetizer
//
//  Created by Shaurya Singh on 29/10/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var orderEnvObject: Order
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(orderEnvObject.items){appetizer in
                            AppetizerListCell(appetizer: appetizer)
                            
                        }.onDelete(perform: { indexSet in
                            orderEnvObject.items.remove(atOffsets: indexSet)
                        })
                    }.listStyle(.plain)
                    
                    Button{
                        //
                    }label: {
                        APButton(buttonLabel: "$\(orderEnvObject.totalPrice, specifier: "%.2f") - Place Order").padding(.bottom,10)
                    }
                }
                if orderEnvObject.items.isEmpty{
                    EmptyState(imageName: "emptyOrder",
                               message: "You have no items in your order. \n Please add an appetizer")
                }
                    
            }.navigationTitle("Orders")
        }
    }
}

#Preview {
    OrderView()
}

//
//  OrderView.swift
//  Appetizer
//
//  Created by Shaurya Singh on 29/10/23.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderitems = MockData.orders
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(orderitems){appetizer in
                            AppetizerListCell(appetizer: appetizer)
                            
                        }.onDelete(perform: { indexSet in
                            orderitems.remove(atOffsets: indexSet)
                        })
                    }.listStyle(.plain)
                    
                    Button{
                        //
                    }label: {
                        APButton(buttonLabel: "Order")
                    }
                }
                if orderitems.isEmpty{
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

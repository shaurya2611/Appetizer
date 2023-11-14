//
//  EmptyState.swift
//  Appetizer
//
//  Created by Shaurya Singh on 14/11/23.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName : String
    let message : String
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea(.all)// fill color in whole screen
            
            VStack{
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(message)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    
                
            }.offset(y:-50)
                
        }
    }
}

//#Preview {
//    EmptyState()
//}

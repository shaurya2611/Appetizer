//
//  XDismissButton.swift
//  Appetizer
//
//  Created by Shaurya Singh on 09/11/23.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width:30, height:30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .frame(width:40, height:40)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    XDismissButton()
}

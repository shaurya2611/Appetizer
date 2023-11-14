//
//  APButton.swift
//  Appetizer
//
//  Created by Shaurya Singh on 09/11/23.
//

import SwiftUI

struct APButton: View {
    // as normal string donot take specifier
    var buttonLabel: LocalizedStringKey
    
    var body: some View {
        Text(buttonLabel)
            .font(.system(.title3))
            .frame(width: 260, height: 40)
            .background(Color.brandPrimary)
            .foregroundColor(Color.white).bold()
            .cornerRadius(10)
    }
}

#Preview {
    APButton(buttonLabel: "Test")
}

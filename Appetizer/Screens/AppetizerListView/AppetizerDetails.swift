//
//  AppetizerDetails.swift
//  Appetizer
//
//  Created by Shaurya Singh on 09/11/23.
//

import SwiftUI

struct AppetizerDetails: View {
    
    @EnvironmentObject var orderEnvObject : Order
    
    //Binding: to pass value to subviews, here below is passed form main list view to subview
    @Binding var isShowingDetailView: Bool
    
    var appetizer: Appetizer
    
    var body: some View {
        VStack{
            AppetizerReoteImage(urlString: appetizer.imageURL)
//                .resizable()  : commneted as resizable() only work with Image() type and above is a view
                .aspectRatio(contentMode: .fit)
                .frame(width:300, height: 225)
                .padding(.bottom,20)
            
            
            VStack(spacing:10){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing:30){
                    VStack(spacing:5){
                        Text("Calories").font(.caption).fontWeight(.medium)
                        Text("\(appetizer.calories)")
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                            .bold()
                            .italic()
                    }
                    
                    VStack(spacing:5){
                        Text("Carbs").font(.caption).fontWeight(.medium)
                        Text("\(appetizer.carbs)")
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                            .bold()
                            .italic()
                    }
                    
                    VStack(spacing:5){
                        Text("Protein").font(.caption).fontWeight(.medium)
                        Text("\(appetizer.protein)")
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                            .bold()
                            .italic()
                    }
                }
            }
            
            Spacer()
            
            Button{
                orderEnvObject.items.append(appetizer) // adding appetizer to env object order
                isShowingDetailView = false
            }label: {
                APButton(buttonLabel: "$\(appetizer.price, specifier: "%.2f") - Add To Order")
            }.padding(.bottom,18)
        }
        .frame(width:300, height:525)
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(radius: 20)
        // overlay : is kind of same zstack, which overlay view on another view with specified alignment
        .overlay(alignment: .topTrailing) {
            Button{
                isShowingDetailView = false
            }label: {
                XDismissButton()
            }.padding(3)
        }
        
    }
}

//#Preview {
//    AppetizerDetails()
//}

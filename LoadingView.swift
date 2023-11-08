//
//  LoadingView.swift
//  Appetizer
//
//  Created by Shaurya Singh on 08/11/23.
//

import SwiftUI

/* Swift UI donot has spinning loading view effect, thus using UIView for that
 UIViewRrepresntable : A wrapper for a UIKit view that you use to integrate that view into your SwiftUI view hierarchy.
 UIActivityIndicatorView : This shows a task is in progress
 */
struct ActivityIndicator: UIViewRepresentable{
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatiorView = UIActivityIndicatorView(style: .large)
        activityIndicatiorView.color = UIColor(.brandPrimary)
        activityIndicatiorView.startAnimating()
        return  activityIndicatiorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
    
    
}

struct LoadingView : View{
    var body: some View{
        ZStack{
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            
            ActivityIndicator()
        }
    }
}

//
//  RemoteImage.swift
//  Appetizer
//
//  Created by Shaurya Singh on 08/11/23.
//

import SwiftUI

final class ImageLoader: ObservableObject{
    
    @Published var image : Image? = nil
    
    func load(fromURLString urlString: String){
        NetworkManager.shared.downlaodImage(fromURLString: urlString) { uiImage in
            // since uiImage we are getting can be nil or have image
            
            // Handling nil case
            guard let uiImage = uiImage else{
                return
            }
            // Initializing Swift Image with UIImage
            
            // bcz it trigger an UI Change hence it has to be dispatch in main queue
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
            
        }
    }
}

struct RemoteImage: View {
    var image: Image? // optional type, can be nil
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable() // placing resizable() here, as it can be used only woth image
    }
}


struct AppetizerReoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.load(fromURLString: urlString)
            }
    }
}

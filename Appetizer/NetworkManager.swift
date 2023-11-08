//
//  NetworkManager.swift
//  Appetizer
//
//  Created by Shaurya Singh on 31/10/23.
//

import Foundation
import UIKit

// As per the apple sugg. network manger class has to be singleton, hence marked final
final class NetworkManager{
    
    static let shared = NetworkManager()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL =  baseURL + "appetizers"
    
    // Implementing Cache, to prevent network call for images every time view load
    private let cache = NSCache<NSString, UIImage>() // its abscially a key-value pair
    
    private init(){
        
    }
    
    /* on funtion completion either return array of appetizers or return error

     @non-escaping Clouse:
     --------------------
     * By deafult clousres are non-escaping
     * Life of clousre in with in that particular funtion execution only
     
     
     @escaping Clouse:
     ----------
     * An attribute used to annotate closure parameters in function
     * Mostly used in network call funtion
     
     Result :
     -------
     * Swift’s Result type is implemented as an enum that has two cases: success and failure.
     * Where failure must have to be Swift Error or specific error type
     * Below case result has to be array of appetizer or an error  */
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
       
        // create an URL object from string, if not return error
        guard let url = URL(string: appetizerURL) else{
            completed(.failure(.inValidURL))
            return
        }
        
        /* once URl object is created , we need to open session wiht that url object
        
        datatask : Creates a task that retrieves the contents of a URL based on the specified URL request object, and calls a handler upon completion. 
         
         The completion handler to call when the load request is complete */
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            // since data, response and error all are optional, hence need to be handeled and unwrapped
            
            // if error!= null execite code block
            if error != nil {
                completed(.failure(.unableToComplete))
                return
            }
            
            //typecasting response into httpurl rsponse and checking for 200 status code
            guard let response = response as? HTTPURLResponse, response.statusCode==200 else{
                completed(.failure(.inValidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.inValidData))
                return
            }
            
            // using JSONDecoder to convert data into AppetizerResponse type i.e. [Appetizer] here
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                // in acse of success return array of Appetizers
                completed(.success(decodedResponse.request ))
            }catch{
                completed(.failure(.inValidData))
            }
            
        }
        task.resume()
    }
    
    
    // marked UIIMage? optional as UIIamge can be nil also
    func downlaodImage(fromURLString urlString: String, completionHandler: @escaping (UIImage?) -> Void){
        
        // befor downlaoding image checking image in cache
        let cacheKey = NSString(string: urlString)
        // if present in cache return the vakue for key
        if let image = cache.object(forKey: cacheKey){
            completionHandler(image)
            return
        }
        
        // check if URL is correct
        guard let url = URL(string: urlString)else{
            completionHandler(nil)
            return
        }
   
       let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
           // response and error all are optional, but here no need to handle and unwrap them as completionHandler(UIImage) is marked as optional
           
           // checking the data and converting image server response into UIImage
           guard let data = data, let image = UIImage(data: data) else {
               completionHandler(nil)
               return
           }
           
           self.cache.setObject(image, forKey: cacheKey)
           
           completionHandler(image)
           
       }
       task.resume()
    }
   
    
}

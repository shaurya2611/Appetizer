//
//  Appetizer.swift
//  Appetizer
//
//  Created by Shaurya Singh on 30/10/23.
//

import Foundation

// decodable : convert json data into object, while getting data from server
// encodable : covert objec to json, req while uploading data to server
// codable = decodable + encodable

struct Appetizer: Decodable , Identifiable{
    let protein: Int
    let imageURL: String
    let carbs: Int
    let id: Int
    let name: String
    let price: Double
    let description: String
    let calories: Int
}

struct AppetizerResponse: Decodable {
    /*
     form api : https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers
     we are getting array of response , hence reponse has to be of same type
     */
    let request: [Appetizer]
}


struct MockData{
    static let sampleAppetizer = Appetizer(protein: 14,
                                        imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
                                        carbs: 0,
                                        id: 1,
                                        name: "Asian Flank Steak",
                                           price: 8.8989,
                                        description: "This perfectly thin cut just melts in your mouth.",
                                        calories: 300)
    
    static let sampleResponse = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}

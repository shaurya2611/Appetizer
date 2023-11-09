//
//  APError.swift
//  Appetizer
//
//  Created by Shaurya Singh on 08/11/23.
//

import Foundation

// creating ou custom error enum
enum APError: Error{  // APErroof type Error
    case inValidURL
    case inValidResponse
    case inValidData
    case unableToComplete
}

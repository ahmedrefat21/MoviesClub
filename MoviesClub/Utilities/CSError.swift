//
//  CSError.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 25/08/2024.
//

import Foundation

enum CSError : String,Error {
    
    case unableToComplete = "Unable to completed your request. Please check your internet connection."
    case invailedResponse = "Invalid response from the server.Please try again"
    case invailedData = "The data received from the server was invailed. Please try again."
    case invalidURL = "The URL for the request could not be created."
}


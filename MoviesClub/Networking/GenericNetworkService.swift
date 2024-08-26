//
//  GenericNetworkService.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 25/08/2024.
//

import Foundation

struct GenericNetworkService {
    
    private static let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
    
    
    static func getData<T: Decodable>(from url: URL) async throws -> T {
        let request = URLRequest(url: url)
        
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error in response")
                throw CSError.invailedResponse
            }
            
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
            
        } catch {
            if let urlError = error as? URLError {
                print(urlError.localizedDescription)
                throw CSError.unableToComplete
            } else if let decodingError = error as? DecodingError {
                print("Decoding error: \(decodingError.localizedDescription)")
                throw CSError.invailedData
            } else {
                print("Unknown error: \(error.localizedDescription)")
                throw CSError.unableToComplete
            }
        }
    }

    
}

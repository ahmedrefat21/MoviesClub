//
//  GenericNetworkService.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 25/08/2024.
//

import Foundation

struct GenericNetworkService {
    
    private static let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
    
    static func getData<T:Decodable>(from url: URL,completion: @escaping(Result<T,CSError>) -> Void) {
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            
            if let anyError = error {
                print(anyError.localizedDescription)
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse ,(200...299).contains(response.statusCode) else {
                print("Error in response")
                completion(.failure(.invailedResponse))
                return
            }
            
            guard let data = data else {
                print("Error in data")
                completion(.failure(.invailedData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch (let error) {
                print("Cache error \(error.localizedDescription)")
                completion(.failure(.invailedData))
            }
        }
        task.resume()
        
    }
    
}

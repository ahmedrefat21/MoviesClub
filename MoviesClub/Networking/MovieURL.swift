//
//  MovieURL.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 25/08/2024.
//

import Foundation


struct MovieURL {
    
    private static let baseMovieURLString = "https://api.themoviedb.org/3/"
    private static let baseImageURLString = "https://image.tmdb.org/t/p/w500/"
    private static let apiKey = "Your API Key"
    
    private static func movieURL(endpoint: MovieEndpoint,parameters: [String:String]?) -> URL {
        
        var components = URLComponents(string: baseMovieURLString+endpoint.rawValue)!
        
        var queryItems: [URLQueryItem] = []
        
        let baseParams: [String:String] = [
            "api_key":apiKey
        ]
        
        for(key,value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let aditionalParameters = parameters {
            for (key,value) in aditionalParameters {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        
        components.queryItems = queryItems
        
        return components.url!
    }
    
    
    static var movieGenreListUrl: URL {
        return movieURL(endpoint: .movieGenreList, parameters: nil)
    }
    
    static var popularListUrl: URL {
        return movieURL(endpoint: .popular, parameters: nil)
    }
    
    static var topRatedListUrl: URL {
        return movieURL(endpoint: .topRated, parameters: nil)
    }
    
    static var upcomingListUrl: URL {
        return movieURL(endpoint: .upcoming, parameters: nil)
    }
    
    static var nowPlayinListUrl: URL {
        return movieURL(endpoint: .nowPlaying, parameters: ["release_date.lte":"2024-09-08","release_date.gte":"2024-08-08"])
    }
    
    static func moviesWithGenreUrl(withGenre genre:String) -> URL {
        return movieURL(endpoint: .movieWithGenre, parameters: ["with_genres" : genre])
    }
    
    static func movieSearchUrl(withQuery query:String) -> URL {
        return movieURL(endpoint: .searchMovie, parameters: ["query" : query])
    }
    
    static func movieDetailUrl(withId movieId:String) -> URL {
        return movieURL(endpoint: .details(movieId: movieId), parameters: nil)
    }
    
    static func creditsUrl(withId movieId:String) -> URL {
        return movieURL(endpoint: .credits(movieId: movieId), parameters: nil)
    }
    
    static func similar(withId movieId: String) -> URL {
        return movieURL(endpoint: .similar(movieId: movieId), parameters: nil)
    }
    
    
}


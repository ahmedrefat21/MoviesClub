//
//  MovieEndpoint.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 25/08/2024.
//

import Foundation


enum MovieEndpoint {
    
    case movieGenreList
    case popular
    case topRated
    case upcoming
    case nowPlaying
    case movieWithGenre
    case searchMovie
    case details(movieId: String)
    case credits(movieId: String)
    case similar(movieId: String)
    
    var rawValue: String {
        switch self {
        case .movieGenreList: return "genre/movie/list"
        case .popular: return "movie/popular"
        case .topRated: return "movie/top_rated"
        case .upcoming: return "movie/upcoming"
        case .nowPlaying: return "movie/now_playing"
        case .movieWithGenre: return "discover/movie"
        case .searchMovie: return "search/movie"
        case .details(let movieId): return "movie/\(movieId)"
        case .credits(let movieId): return "movie/\(movieId)/credits"//Cast
        case .similar(let movieId): return "movie/\(movieId)/similar"
        }
    }
}


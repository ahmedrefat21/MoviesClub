//
//  MovieNetwork.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 25/08/2024.
//

import Foundation

class MovieNetwork {
    static let shared = MovieNetwork()
    
  
    
    func fetchPopularList() async throws -> Movies {
        guard let url = MovieURL.popularListUrl else { throw CSError.invalidURL }
        return try await GenericNetworkService.getData(from: url)
    }

    func fetchTopRatedList() async throws -> Movies {
        guard let url = MovieURL.topRatedListUrl else { throw CSError.invalidURL }
        return try await GenericNetworkService.getData(from: url)
    }

    func fetchUpcomingList() async throws -> Movies {
        guard let url = MovieURL.upcomingListUrl else { throw CSError.invalidURL }
        return try await GenericNetworkService.getData(from: url)
    }

    func fetchNowPlayingList() async throws -> Movies {
        
        guard let url = MovieURL.nowPlayinListUrl else { throw CSError.invalidURL }
        return try await GenericNetworkService.getData(from: url)
    }

    func fetchWithGenreMovies(with genreId: Int) async throws -> Movies {
        guard let url = MovieURL.moviesWithGenreUrl(withGenre: "\(genreId)") else { 
            throw CSError.invalidURL }
        return try await GenericNetworkService.getData(from: url)
    }

    func fetchMovieSearch(query: String) async throws -> Movies {
        guard let url = MovieURL.movieSearchUrl(withQuery: query) else { throw CSError.invalidURL }
        return try await GenericNetworkService.getData(from: url)
    }

    func fetchMovieDetail(withId movieId: Int) async throws -> MovieDetail {
        guard let url = MovieURL.movieDetailUrl(withId: "\(movieId)") else { throw CSError.invalidURL }
        return try await GenericNetworkService.getData(from: url)
    }

    func fetchSimilarList(withId movieId: Int) async throws -> Movies {
        guard let url = MovieURL.similar(withId: "\(movieId)") else { throw CSError.invalidURL }
        return try await GenericNetworkService.getData(from: url)
    }

    
}

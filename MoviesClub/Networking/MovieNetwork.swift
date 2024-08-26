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
        let url = MovieURL.popularListUrl
        return try await GenericNetworkService.getData(from: url)
    }

    func fetchTopRatedList() async throws -> Movies {
        let url = MovieURL.topRatedListUrl
        return try await GenericNetworkService.getData(from: url)
    }

    func fetchUpcomingList() async throws -> Movies {
        let url = MovieURL.upcomingListUrl
        return try await GenericNetworkService.getData(from: url)
    }

    func fetchNowPlayingList() async throws -> Movies {
        let url = MovieURL.nowPlayinListUrl
        return try await GenericNetworkService.getData(from: url)
    }

    func fetchWithGenreMovies(with genreId: Int) async throws -> Movies {
        let url = MovieURL.moviesWithGenreUrl(withGenre: "\(genreId)")
        return try await GenericNetworkService.getData(from: url)
    }

    func fetchMovieSearch(query: String) async throws -> Movies {
        let url = MovieURL.movieSearchUrl(withQuery: query)
        return try await GenericNetworkService.getData(from: url)
    }

    func fetchMovieDetail(withId movieId: Int) async throws -> MovieDetail {
        let url = MovieURL.movieDetailUrl(withId: "\(movieId)")
        return try await GenericNetworkService.getData(from: url)
    }

    func fetchSimilarList(withId movieId: Int) async throws -> Movies {
        let url = MovieURL.similar(withId: "\(movieId)")
        return try await GenericNetworkService.getData(from: url)
    }

    
}

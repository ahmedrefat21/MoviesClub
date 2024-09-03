//
//  HomeRepositoryProtocol.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 03/09/2024.
//

import Foundation


protocol MovieRepositoryProtocol{
    func fetchPopularList() async throws -> Movies
    func fetchTopRatedList() async throws -> Movies
    func fetchUpcomingList() async throws -> Movies
    func fetchNowPlayingList() async throws -> Movies
    func fetchMovieSearch(query: String) async throws -> Movies
    func fetchMovieDetail(withId movieId: Int) async throws -> MovieDetail
    func fetchSimilarList(withId movieId: Int) async throws -> Movies
    func fetchCastList(withId movieId: Int) async throws -> Credit
    
}

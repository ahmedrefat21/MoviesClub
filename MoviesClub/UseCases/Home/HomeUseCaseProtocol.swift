//
//  HomeUseCaseProtocol.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 03/09/2024.
//

import Foundation

protocol HomeUseCaseProtocol {
    func fetchPopularMovies() async throws -> Movies
    func fetchTopRatedMovies() async throws -> Movies
    func fetchUpcomingMovies() async throws -> Movies
    func fetchNowPlayingMovies() async throws -> Movies
}


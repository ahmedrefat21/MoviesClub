//
//  MockHomeUseCase.swift
//  MoviesClub_Tests
//
//  Created by Ahmed Refat on 06/03/2025.
//

import Foundation
@testable import MoviesClub

class MockHomeUseCase: HomeUseCaseProtocol {
    var shouldThrowError = false
    
    private let mockMovies = Movies(
        page: 1,
        results: [
            Movie(
                adult: false,
                backdropPath: "/backdrop1.jpg",
                genreIDS: [28, 12],
                id: 1,
                originalTitle: "Test Movie 1",
                overview: "Overview 1",
                popularity: 123.4,
                posterPath: "/poster1.jpg",
                releaseDate: "2024-03-15",
                title: "Test Movie 1",
                video: false,
                voteAverage: 8.0,
                voteCount: 100
            ),
            Movie(
                adult: false,
                backdropPath: "/backdrop2.jpg",
                genreIDS: [28, 12],
                id: 2,
                originalTitle: "Test Movie 2",
                overview: "Overview 2",
                popularity: 98.6,
                posterPath: "/poster2.jpg",
                releaseDate: "2024-03-20",
                title: "Test Movie 2",
                video: false,
                voteAverage: 7.5,
                voteCount: 80
            )
        ],
        totalPages: 1,
        totalResults: 2
    )
    
    var mockPopularMovies: Movies { mockMovies }
    var mockTopRatedMovies: Movies { mockMovies }
    var mockUpcomingMovies: Movies { mockMovies }
    var mockNowPlayingMovies: Movies { mockMovies }
    
    func fetchPopularMovies() async throws -> Movies {
        if shouldThrowError {
            throw NSError(domain: "MockError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock error"])
        }
        return mockPopularMovies
    }
    
    func fetchTopRatedMovies() async throws -> Movies {
        if shouldThrowError {
            throw NSError(domain: "MockError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock error"])
        }
        return mockTopRatedMovies
    }
    
    func fetchUpcomingMovies() async throws -> Movies {
        if shouldThrowError {
            throw NSError(domain: "MockError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock error"])
        }
        return mockUpcomingMovies
    }
    
    func fetchNowPlayingMovies() async throws -> Movies {
        if shouldThrowError {
            throw NSError(domain: "MockError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock error"])
        }
        return mockNowPlayingMovies
    }
}

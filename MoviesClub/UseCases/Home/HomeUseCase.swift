//
//  HomeUseCase.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 03/09/2024.
//

import Foundation

class HomeUseCase: HomeUseCaseProtocol {
    private let repository: MovieRepositoryProtocol
    
    init(repository: MovieRepositoryProtocol = MovieRepository()) {
        self.repository = repository
    }
    
    func fetchPopularMovies() async throws -> Movies {
        return try await repository.fetchPopularList()
    }
    
    func fetchTopRatedMovies() async throws -> Movies {
        return try await repository.fetchTopRatedList()
    }
    
    func fetchUpcomingMovies() async throws -> Movies {
        return try await repository.fetchUpcomingList()
    }
    
    func fetchNowPlayingMovies() async throws -> Movies {
        return try await repository.fetchNowPlayingList()
    }
}


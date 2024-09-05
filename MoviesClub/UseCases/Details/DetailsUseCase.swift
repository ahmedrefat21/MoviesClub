//
//  DetailsUseCase.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 03/09/2024.
//

import Foundation
class DetailsUseCase: DetailsUseCaseProtocol {
    
    
    private let repository: MovieRepositoryProtocol
    
    init(repository: MovieRepositoryProtocol = MovieRepository()) {
        self.repository = repository
    }
    
    func fetchMovieDetail(withId movieId: Int) async throws -> MovieDetail {
        return try await repository.fetchMovieDetail(withId: movieId)
    }
    
    func fetchSimilarList(withId movieId: Int) async throws -> Movies {
        return try await repository.fetchSimilarList(withId: movieId)
    }
    
    func fetchCastList(withId movieId: Int) async throws -> Credit {
        return try await repository.fetchCastList(withId: movieId)
    }
    
}



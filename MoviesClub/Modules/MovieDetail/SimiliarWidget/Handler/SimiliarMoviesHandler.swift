//
//  SimiliarMoviesHandler.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 03/09/2024.
//


import Foundation
import Combine
import os

extension SimiliarWidget {
    @MainActor
    class SimiliarMoviesHandler: ObservableObject {
        //MARK: - PROPERTIES
        private let logger = Logger(subsystem: "com.MoviesClub.networking", category: "SimiliarMoviesHandler")
        
        @Published var similarMovies: [Movie] = []
        @Published var errorMessage: String?
        
        private let useCase: DetailsUseCaseProtocol
        
        init(useCase: DetailsUseCaseProtocol = DetailsUseCase()) {
            self.useCase = useCase
        }
        
        //MARK: - getSimilarMovies
        func getSimilarMovies(withId movieId: Int) async {
            do {
                let movies = try await useCase.fetchSimilarList(withId: movieId)
                similarMovies = movies.results
            } catch {
                handleError(error)
            }
        }
        
        // MARK: - Error Handling
        private func handleError(_ error: Error) {
            let errorMessage = error.localizedDescription
            logger.error("Error fetching data: \(errorMessage)")
            self.errorMessage = errorMessage
        }
    }
}







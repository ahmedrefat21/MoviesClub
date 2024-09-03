//
//  TopRatedHandler.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 03/09/2024.
//

import Foundation
import Combine
import os

extension TopRatedList {
    @MainActor
    class TopRatedHandler: ObservableObject {
        //MARK: - PROPERTIES
        private let logger = Logger(subsystem: "com.MoviesClub.networking", category: "HomeViewHandler")
        
        @Published var topRatedMovies: [Movie] = []
        @Published var errorMessage: String?
        
        private let useCase: HomeUseCaseProtocol
        
        init(useCase: HomeUseCaseProtocol = HomeUseCase()) {
            self.useCase = useCase
            Task {
                await self.getTopRatedMovies()
            }
        }
        
        //MARK: - getTopRatedMovies
        func getTopRatedMovies() async {
            do {
                let movies = try await useCase.fetchTopRatedMovies()
                topRatedMovies = movies.results
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



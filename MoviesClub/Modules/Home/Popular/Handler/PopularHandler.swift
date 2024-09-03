//
//  PopularHandler.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 03/09/2024.
//

import Foundation
import Combine
import os

extension PopularView {
    @MainActor
    class PopularHandler: ObservableObject {
        //MARK: - PROPERTIES
        private let logger = Logger(subsystem: "com.MoviesClub.networking", category: "NowPlayingHandler")
        
        @Published var popularMovies: [Movie] = []
        @Published var errorMessage: String?
        
        private let useCase: HomeUseCaseProtocol
        
        init(useCase: HomeUseCaseProtocol = HomeUseCase()) {
            self.useCase = useCase
            Task {
                await self.getPopularMovies()
            }
        }
        
        //MARK: - getPopularMovies
        func getPopularMovies() async {
            do {
                let movies = try await useCase.fetchPopularMovies()
                popularMovies = movies.results
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




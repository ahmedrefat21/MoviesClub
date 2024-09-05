//
//  UpcomingHandler.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 03/09/2024.
//


import Foundation
import Combine
import os

extension UpcomingWidget {
    @MainActor
    class UpcomingHandler: ObservableObject {
        //MARK: - PROPERTIES
        private let logger = Logger(subsystem: "com.MoviesClub.networking", category: "UpcomingHandler")
        
        @Published var upcomingMovies: [Movie] = []
        @Published var errorMessage: String?
        
        private let useCase: HomeUseCaseProtocol
        
        init(useCase: HomeUseCaseProtocol = HomeUseCase()) {
            self.useCase = useCase
            Task {
                await self.getUpcomingMovies()
            }
        }
        
        //MARK: - getUpcomingMovies
        func getUpcomingMovies() async {
            do {
                let movies = try await useCase.fetchUpcomingMovies()
                upcomingMovies = movies.results
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




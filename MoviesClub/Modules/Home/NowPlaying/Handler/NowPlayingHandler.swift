//
//  NowPlayingHandler.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 03/09/2024.
//

import Foundation
import Combine
import os

extension NowPlayingList {
    @MainActor
    class NowPlayingHandler: ObservableObject {
        //MARK: - PROPERTIES
        private let logger = Logger(subsystem: "com.MoviesClub.networking", category: "NowPlayingHandler")
        
        @Published var nowPlayingMovies: [Movie] = []
        @Published var errorMessage: String?
        
        private let useCase: HomeUseCaseProtocol
        
        init(useCase: HomeUseCaseProtocol = HomeUseCase()) {
            self.useCase = useCase
            Task {
                await self.getNowPlayingMovies()
            }
        }
        
        //MARK: - getNowPlayingMovies
        func getNowPlayingMovies() async {
            do {
                let movies = try await useCase.fetchNowPlayingMovies()
                nowPlayingMovies = movies.results
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




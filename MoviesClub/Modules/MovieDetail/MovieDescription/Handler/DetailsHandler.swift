//
//  DetailsHandler.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 03/09/2024.
//

import Foundation
import Combine
import os

extension DetailsContentView {
    @MainActor
    class DetailsHandler: ObservableObject {
        //MARK: - PROPERTIES
        private let logger = Logger(subsystem: "com.MoviesClub.networking", category: "DetailsHandler")
        
        @Published var movieDetail: MovieDetail?
        @Published var errorMessage: String?
        
        private let useCase: DetailsUseCaseProtocol
        
        init(useCase: DetailsUseCaseProtocol = DetailsUseCase()) {
            self.useCase = useCase
        }
        
        //MARK: - getMovieDetail
        func getMovieDetail(withId movieId: Int) async {
            do {
                let movie = try await useCase.fetchMovieDetail(withId: movieId)
                movieDetail = movie
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








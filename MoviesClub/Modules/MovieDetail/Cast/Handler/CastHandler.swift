//
//  CastHandler.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 03/09/2024.
//

import Foundation
import Combine
import os

extension CastsList {
    @MainActor
    class CastHandler: ObservableObject {
        //MARK: - PROPERTIES
        private let logger = Logger(subsystem: "com.MoviesClub.networking", category: "CastHandler")
        
        @Published var casts: [Casts] = []
        @Published var errorMessage: String?
        
        private let useCase: DetailsUseCaseProtocol
        
        init(useCase: DetailsUseCaseProtocol = DetailsUseCase()) {
            self.useCase = useCase
        }
        
        //MARK: - getCasts
        func getCasts(withId movieId: Int) async {
            do {
                let castList = try await useCase.fetchCastList(withId: movieId)
                casts = castList.cast
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





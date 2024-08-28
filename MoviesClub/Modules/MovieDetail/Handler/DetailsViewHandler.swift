//
//  DetailsViewHandler.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import Foundation
import Combine
import os

extension DetailView {
    @MainActor
    class DetailsViewHandler: ObservableObject {
        
        
        //MARK: - PROPERTIES
        private let logger = Logger(subsystem: "com.MoviesClub.networking", category: "DetailsViewHandler")
        @Published var movieDetail: MovieDetail?
        @Published var similarMovies: [Movie] = []
        @Published var casts: [Casts] = []
        @Published var errorMessage: String?
        
        private var movieNetwork = MovieNetwork()
        
        init() {}
        
    
        
        //MARK: - getMovieDetail
        func getMovieDetail(withId movieId: Int) async {
            do {
                let movie = try await movieNetwork.fetchMovieDetail(withId: movieId)
                movieDetail = movie
            } catch {
                handleError(error)
            }
        }
        
        //MARK: - getSimilarMovies
        func getSimilarMovies(withId movieId: Int) async {
            do {
                let movies = try await movieNetwork.fetchSimilarList(withId: movieId)
                similarMovies = movies.results
            } catch {
                handleError(error)
            }
        }
        
        //MARK: - getCasts
        func getCasts(withId movieId: Int) async {
            do {
                let castList = try await movieNetwork.fetchCastList(withId: movieId)
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



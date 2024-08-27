//
//  DetailsViewHandler.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import Foundation
import Combine

extension DetailView {
    @MainActor
    class DetailsViewHandler: ObservableObject {
        
        
        //MARK: - PROPERTIES
        @Published var movieDetail: MovieDetail?
        @Published var similarMovies: [Movie] = []
        
        
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
        
        
        
        // MARK: - Error Handling
        private func handleError(_ error: Error) {
            errorMessage =
            error.localizedDescription
            logger.error("Error fetching data: \(error)")
        }
    }
}



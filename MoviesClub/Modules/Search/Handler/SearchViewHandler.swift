//
//  SearchViewHandler.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 29/08/2024.
//

import Foundation
import Combine
import os

extension SearchView {
    @MainActor
    class SearchViewHandler: ObservableObject {
        
        
        //MARK: - PROPERTIES
        private let logger = Logger(subsystem: "com.MoviesClub.networking", category: "SearchViewHandler")
        @Published var searchedMovies: [Movie] = []
        @Published var errorMessage: String?
        @Published var searchTerm: String = ""
        @Published var isComplete: Bool = false
        
        private var cancellables = Set<AnyCancellable>()
        private var movieNetwork = MovieNetwork()
        
        init() {
            $searchTerm                            
                .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
                .removeDuplicates()
                .sink { [weak self] newValue in
                    Task {
                        await self?.getMovies(query: newValue)
                        self?.isComplete = !newValue.isEmpty
                    }
                }
                            
                .store(in: &cancellables)
        }
        
        //MARK: - getMovies
        func getMovies(query movieTitle:String) async {
            self.searchedMovies.removeAll()
            do {
                let movies = try await movieNetwork.fetchMovieSearch(query: movieTitle)
                searchedMovies = movies.results
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


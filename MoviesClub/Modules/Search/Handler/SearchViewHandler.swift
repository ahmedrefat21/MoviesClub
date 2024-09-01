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
        @Published var state: SearchScreenState = .initial
        
        private var cancellables = Set<AnyCancellable>()
        private var movieNetwork = MovieNetwork()
        
        init() {
            $searchTerm                            
                .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
                .removeDuplicates()
                .sink { [weak self] newValue in
                    self?.updateState(for: newValue)
                }
                            
                .store(in: &cancellables)
        }
        
        
        // MARK: - Update State
        private func updateState(for searchTerm: String) {
            guard !searchTerm.isEmpty else {
                state = .initial
                return
            }
            
            state = .loading
            Task {
                await getMovies(query: searchTerm)
                state = searchedMovies.isEmpty ? .emptySearchResults : .searchedMovies
            }
            
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


enum SearchScreenState {
    case initial
    case loading
    case emptySearchResults
    case searchedMovies
}

//
//  HomeViewHandler.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import Foundation
import Combine

extension HomeView {
    @MainActor
    class HomeViewHandler: ObservableObject {
        //MARK: - PROPERTIES
        
        @Published var topRatedMovies: [Movie] = []
        
        
        private var movieNetwork = MovieNetwork()
        
        init() {
            
        }
        
        //MARK: - FUNCTIONS
        
        
        
        //MARK: - getTopRatedMovies
        func getTopRatedMovies() async {
            do {
                let movies = try await movieNetwork.fetchTopRatedList()
                topRatedMovies = movies.results
            } catch {
                print(error.localizedDescription)
            }
        }
        
        
    }
}


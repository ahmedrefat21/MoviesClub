//
//  HomeViewHandler.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import Foundation
import Combine
import os

extension HomeView {
    @MainActor
    class HomeViewHandler: ObservableObject {
        //MARK: - PROPERTIES
        
        private static let logger = Logger(subsystem: "com.MoviesClub.networking", category: "HomeViewHandler")
        
        @Published var topRatedMovies: [Movie] = []
        @Published var nowPlayingMovies: [Movie] = []
        @Published var popularMovies: [Movie] = []
        @Published var upcomingMovies: [Movie] = []
        
        private var movieNetwork = MovieNetwork()
        
        init() {
            Task {
                await getAllMovies()
            }
        }
        
        //MARK: - FUNCTIONS
        
        private func getAllMovies() async {
            await withTaskGroup(of: Void.self) { group in
                group.addTask { await self.getTopRatedMovies() }
                group.addTask { await self.getNowPlayingMovies() }
                group.addTask { await self.getPopularMovies() }
                group.addTask { await self.getUpcomingMovies() }
            }
        }
        
        //MARK: - getTopRatedMovies
        func getTopRatedMovies() async {
            do {
                let movies = try await movieNetwork.fetchTopRatedList()
                topRatedMovies = movies.results
            } catch {
                handleError(error)
            }
        }
        
        //MARK: - getNowPlayingMovies
        func getNowPlayingMovies() async {
            do {
                let movies = try await movieNetwork.fetchNowPlayingList()
                nowPlayingMovies = movies.results
            } catch {
                handleError(error)
            }
        }
        //MARK: - getPopularMovies
        func getPopularMovies() async {
            do {
                let movies = try await movieNetwork.fetchPopularList()
                popularMovies = movies.results
            } catch {
                handleError(error)
            }
        }
        
        //MARK: - getUpcomingMovies
        func getUpcomingMovies() async {
            do {
                let movies = try await movieNetwork.fetchUpcomingList()
                upcomingMovies = movies.results
            } catch {
                handleError(error)
            }
        }
        
        
        // MARK: - Error Handling
                
        private func handleError(_ error: Error) {
            errorMessage = error.localizedDescription
            logger.error("Error fetching data: \(error)")
        }
    }
}

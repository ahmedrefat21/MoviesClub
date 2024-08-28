//
//  Extenstion+DetailView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 28/08/2024.
//

import Foundation

extension DetailView {
    // MARK: - METHODS
    func loadData() {
        Task {
            await handler.getMovieDetail(withId: movieId)
            await handler.getSimilarMovies(withId: movieId)
            await handler.getCasts(withId: movieId)
        }
    }
}

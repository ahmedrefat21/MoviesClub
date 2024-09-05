//
//  DetailsUseCaseProtocol.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 03/09/2024.
//

import Foundation

protocol DetailsUseCaseProtocol {
    func fetchMovieDetail(withId movieId: Int) async throws -> MovieDetail
    func fetchSimilarList(withId movieId: Int) async throws -> Movies
    func fetchCastList(withId movieId: Int) async throws -> Credit
    
}



//
//  NowPlayingView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 03/09/2024.
//

import SwiftUI

struct SimiliarWidget: View {
    @StateObject private var handler: SimiliarMoviesHandler = .init()
    
    //MARK: - PROPERTIES
    let movieId: Int
    
    //MARK: - Body
    var body: some View {
        if handler.errorMessage == nil {
            StandardList(title: "Similar Movies", movies: handler.similarMovies ,font: .titleMedium)
            
                .onAppear{
                    Task {
                        await handler.getSimilarMovies(withId: movieId)
                    }
                }
        }
    }
        
}

#Preview {
    SimiliarWidget(movieId: 845111)
}

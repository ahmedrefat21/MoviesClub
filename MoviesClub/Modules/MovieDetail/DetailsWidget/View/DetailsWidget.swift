//
//  DetailsContentView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 03/09/2024.
//

import SwiftUI

struct DetailsWidget: View {
    
    @StateObject private var handler: DetailsHandler = .init()
    //MARK: - PROPERTIES
    let movieId: Int
    
    //MARK: - Body
    var body: some View {
        VStack {
            if handler.errorMessage == nil {
                if let movieDetail = handler.movieDetail {
                    PosterView(posterImage: movieDetail.backdropPath, voteRate: movieDetail.voteAverage)
                        .overlay(
                            DetailsHeader(movie: movieDetail)
                                .offset(y: 130),
                            alignment: .bottom
                        )
                    DescriptionView(movie: movieDetail)
                        .padding(.top, 140)
                    
                }
            }
        }
            .onAppear{
                Task {
                    await handler.getMovieDetail(withId: movieId)
                }
                
            }
    }
    
}

#Preview {
    DetailsWidget(movieId: 845111)
}

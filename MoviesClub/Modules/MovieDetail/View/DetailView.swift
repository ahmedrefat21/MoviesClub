//
//  DetailView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - PROPERTIES
    @StateObject private var handler: DetailsViewHandler = .init()
    @Environment(\.presentationMode) private var presentationMode
    let movieId: Int
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            if let errorMessage = handler.errorMessage {
                ErrorView(errorMessage: errorMessage)
               
            } else {
                detailsBar
                movieDetailContent
            }
        }
        .background(BackgroundStyle.background)
        .onAppear(perform: loadData)
        .navigationBarHidden(true)
    }
    
    // MARK: - COMPONENTS
    private var detailsBar: some View {
        HStack {
            backButton
            Spacer()
        }
        .padding(.horizontal, 15)
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward")
                    .foregroundStyle(Color.textBase)
                    .font(.titleLarge)

            }
        }
    }
    
    @ViewBuilder
    private var movieDetailContent: some View {
        if let movieDetail = handler.movieDetail {
            ScrollView(.vertical, showsIndicators: false) {
                PosterView(movieDetail: movieDetail)
                    .overlay(
                        DetailsHeader(movie: movieDetail)
                            .offset(y: 130),
                        alignment: .bottom
                    )
                
                DescriptionView(movie: movieDetail)
                    .padding(.top, 140)
                CastsList(casts: handler.casts)
                SimilarMoviesList(movies: handler.similarMovies)
            }
        }
    }
    
    // MARK: - METHODS
    private func loadData() {
        Task {
            await handler.getMovieDetail(withId: movieId)
            await handler.getSimilarMovies(withId: movieId)
            await handler.getCasts(withId: movieId)
        }
    }
}

#Preview {
    DetailView(movieId: 845111)
}


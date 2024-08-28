//
//  DetailView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - PROPERTIES
    @StateObject  var handler: DetailsViewHandler = .init()
    @Environment(\.presentationMode) private var presentationMode
    let movieId: Int
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
                detailsBar
                ScrollView(.vertical, showsIndicators: false) {
                    if let movieDetail = handler.movieDetail {
                        PosterView(posterImage: movieDetail.backdropPath, voteRate: movieDetail.voteAverage)
                            .overlay(
                                DetailsHeader(movie: movieDetail)
                                    .offset(y: 130),
                                alignment: .bottom
                            )
                        DescriptionView(movie: movieDetail)
                            .padding(.top, 140)
                        CastsList(casts: handler.casts)
                        StandardList(title: "Similar Movies", movies: handler.similarMovies ,font: .titleMedium)
                    }
                }
            
        }
        .background(BackgroundStyle.background)
        .onAppear(perform: loadData)
        .navigationBarHidden(true)
        .overlay{
            if let errorMessage = handler.errorMessage {
                VStack {
                    ErrorView(errorMessage: errorMessage)
                    Spacer()
                }
            }
        }
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
    
    
}

#Preview {
    DetailView(movieId: 845111)
}


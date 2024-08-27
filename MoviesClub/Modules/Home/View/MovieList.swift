//
//  MovieList.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 26/08/2024.
//

import SwiftUI


// MARK: - MovieType
enum MovieListType {
    case standart
    case nowPlaying
    case topRated
}


struct MovieList: View {
    // MARK: - PROPERTIES
    var movies: [Movie]
    var listType: MovieListType

    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(movies.indices, id: \.self) { index in
                    switch listType {
                    case .standart:
                        StandardListItem(movie: movies[index])
                    case .nowPlaying:
                        NowPlayingListItem(movie: movies[index])
                    case .topRated:
                        TopRatedListItem(movie: movies[index], number: index + 1)
                    }
                }
            }
        }
    }
}

#Preview {
    MovieList(movies: [Constants().sampleMovie, Constants().sampleMovie], listType: .standart)
}



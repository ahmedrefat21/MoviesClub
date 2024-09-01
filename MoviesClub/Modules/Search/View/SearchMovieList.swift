//
//  SearchMovieList.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 29/08/2024.
//

import SwiftUI

struct SearchMovieList: View {
    
    // MARK: - Properties
    var movies: [Movie]
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment:.leading,spacing: 15){
                ForEach(movies.indices, id: \.self) { index in
                    NavigationLink(destination: DetailView(movieId: movies[index].id ?? 0)) {
                        SearchMovieItem(posterImage: movies[index].posterPath, voteRate:  movies[index].voteAverage, releaseDate: movies[index].releaseDate, title: movies[index].title)
                    }
                }
            }
        }
    }
}

#Preview {
    SearchMovieList(movies: [Constants().sampleMovie, Constants().sampleMovie])
}




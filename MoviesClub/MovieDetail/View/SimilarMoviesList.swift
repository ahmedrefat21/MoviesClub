//
//  SimilarMoviesList.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct SimilarMoviesList: View {
    //MARK: - PROPERTIES
    var movies: [Movie]
    
    // MARK: - BODY
    var body: some View {
        VStack (alignment: .leading){
            SubTitleView(title: "Similiar Movies")
                .padding(.leading,10)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(movies.indices, id: \.self) { index in
                        StandardListItem(movie: movies[index])
                    }
                }
            }
        }
        .padding(.bottom,20)
    }
}

#Preview {
    SimilarMoviesList(movies: [sampleMovie, sampleMovie] )
}


//
//  TopRatedList.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct TopRatedList: View {
    
    var movies: [Movie]
    var body: some View {
        VStack (alignment: .leading){
            TitleView(title: "Top Rated Movies", font: .titleLarge, addShadow: true)
                .padding(.leading,10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(movies.indices, id: \.self) { index in
                        NavigationLink(destination: DetailView(movieId: movies[index].id ?? 0)) {
                            TopRatedListItem(movie: movies[index], number: index + 1)
                        }
                    }
                }
            }
        }
        .padding(.bottom,20)
    }
    
}

#Preview {
    TopRatedList(movies: [Constants().sampleMovie, Constants().sampleMovie])
}

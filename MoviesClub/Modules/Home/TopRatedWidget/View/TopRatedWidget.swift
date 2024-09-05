//
//  TopRatedList.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct TopRatedWidget: View {
    
    
    @StateObject private var handler: TopRatedHandler = .init()

    var body: some View {
        if handler.errorMessage == nil {
            VStack (alignment: .leading){
                TitleView(title: "Top Rated Movies", font: .titleLarge, addShadow: true)
                    .padding(.leading,10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(handler.topRatedMovies.indices, id: \.self) { index in
                            NavigationLink(destination: DetailScreen(movieId:handler.topRatedMovies [index].id ?? 0)) {
                                TopRatedListItem(movie: handler.topRatedMovies [index], number: index + 1)
                            }
                        }
                    }
                }
            }
            .padding(.bottom,20)
        }
    }
}

#Preview {
    TopRatedWidget()
}

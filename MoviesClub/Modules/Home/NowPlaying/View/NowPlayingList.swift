//
//  NowPlayingList.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct NowPlayingList: View {
    
    @StateObject private var handler: NowPlayingHandler = .init()
    var body: some View {
        if handler.errorMessage == nil {
            VStack (alignment: .leading){
                TitleView(title: "Now Playing Movies", font: .titleLarge, addShadow: true)
                    .padding(.leading,10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(handler.nowPlayingMovies.indices, id: \.self) { index in
                            NavigationLink(destination: DetailView(movieId: handler.nowPlayingMovies[index].id ?? 0)) {
                                NowPlayingListItem(movie: handler.nowPlayingMovies[index])
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
    NowPlayingList()
}

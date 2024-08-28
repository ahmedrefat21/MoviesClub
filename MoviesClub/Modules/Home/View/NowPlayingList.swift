//
//  NowPlayingList.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct NowPlayingList: View {
    var movies: [Movie]
    var body: some View {
        VStack (alignment: .leading){
            TitleView(title: "Now Playing Movies")
                .padding(.leading,10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(movies.indices, id: \.self) { index in
                        NowPlayingListItem(movie: movies[index])
                    }
                }
            }
        }
        .padding(.bottom,20)
    }
}

#Preview {
    NowPlayingList(movies: [Constants().sampleMovie, Constants().sampleMovie])
}

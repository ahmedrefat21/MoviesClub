//
//  StandardList.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct StandardList: View {
    var title: String
    var movies: [Movie]
    var font : Font
    var body: some View {
        VStack (alignment: .leading){
            TitleView(title: title, font: font, addShadow: true)
            
                .padding(.leading,10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(movies.indices, id: \.self) { index in
                        NavigationLink(destination: DetailScreen(movieId: movies[index].id ?? 0)) {
                            StandardListItem(movie: movies[index])
                        }
                    }
                }
            }
        }
        .padding(.bottom,20)
    }
}

#Preview {
    StandardList(title: "Popular Movies", movies:  [Constants().sampleMovie, Constants().sampleMovie],font: .titleLarge)
}

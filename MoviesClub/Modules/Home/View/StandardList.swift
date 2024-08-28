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
    var body: some View {
        VStack (alignment: .leading){
            TitleView(title: title)
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
    StandardList(title: "Popular Movies", movies:  [Constants().sampleMovie, Constants().sampleMovie])
}

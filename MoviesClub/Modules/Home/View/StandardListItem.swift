//
//  StandardListItem.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 26/08/2024.
//

import SwiftUI

struct StandardListItem: View {
    var movie: Movie
    var body: some View {
        VStack(spacing:0){
            if let imagePath = movie.posterPath{
                CustomImageView(imagePath: imagePath)
                    .frame(width: 100,height: 145)
                    .clipShape(.rect(cornerRadius: 16))
            }
        }
        .padding(10)
    }
}

#Preview {
    StandardListItem(movie: Constants().sampleMovie)
}

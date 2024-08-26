//
//  TopRatedListItem.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 26/08/2024.
//

import SwiftUI

struct TopRatedListItem: View {
    //MARK: - PROPERTIES
    var movie: Movie
    var number: Int
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            if let imagePath = movie.poster_path{
                CustomImageView(imagePath: imagePath)
                    .scaledToFit()
                    .frame(width: 140,height: 210)
                    .clipShape(.rect(cornerRadius: 16))
                
                StrokeText(
                    text: "\(number)",
                    width: 0.75,
                    color: .textStroke)
                .font(.titleVeryLarge)
                .fontWeight(.bold)
                .imageScale(.large)
                .offset(x:-60,y:90)
                .foregroundStyle(Color.backgroundDark)
                
            }
        }
        .padding(.vertical,15)
        .padding(.horizontal,15)
    }
}

#Preview {
    TopRatedListItem(movie: Constants.sampleMovie, number: 1)
}



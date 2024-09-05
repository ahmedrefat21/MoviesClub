//
//  NowPlayingListItem.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 26/08/2024.
//

import SwiftUI

struct NowPlayingListItem: View {
    //MARK: - PROPERTIES
    var movie: Movie
    //MARK: - BODY
    var body: some View {
        HStack(spacing:15) {
            if let imagePath = movie.backdropPath,let title = movie.title,let voteAverage = movie.voteAverage,let releaseDate = movie.releaseDate{
                CustomImageView(imagePath: imagePath)
                    .scaledToFit()
                    .frame(width: 175,height: 100)
                    .clipShape(.rect(cornerRadius: 16))
                
                VStack (alignment:.leading,spacing: 10){
                    //MARK: - TITLE
                    Text(title)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .font(.titleLitle)
                        .foregroundStyle(Color.textBase)

                    
                    //MARK: - VOTEAVERAGE
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundStyle(Color.star)
                        
                        Text(NSNumber(value: voteAverage),formatter: doubleFormatter)
                            .font(.detailBase)
                            .foregroundStyle(Color.star)

                    }
                    
                    //MARK: - RDate
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundStyle(Color.textBase)
                        
                        Text(releaseDate)
                            .font(.detailBase)
                            .foregroundStyle(Color.textBase)
                    }
                    
                }
            }
            Spacer()
        }
        .frame(maxWidth: 350)
        .padding(.horizontal,10)
        .padding(.vertical,10)
    }
}

#Preview {
    NowPlayingListItem(movie: Constants().sampleMovie)
}

//
//  SearchMovieItem.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 29/08/2024.
//

import SwiftUI

struct SearchMovieItem: View {
    
    // MARK: - Properties
    @State var isAnimating = false
    var posterImage: String?
    var voteRate: Double?
    var releaseDate : String?
    var title : String?
    
    
    // MARK: - BODY
    var body: some View {
        VStack {
            if let imagePath = posterImage,
               let title = title,
               let voteAverage = voteRate,
               let releaseDate = releaseDate {
                
                HStack(spacing:30){
                    CustomImageView(imagePath: imagePath)
                        .frame(width: 140,height: 200)
                        .clipShape(.rect(cornerRadius: 16))
                        .scaleEffect(isAnimating ? 1 : 0.7)
                        .opacity(isAnimating ? 1 : 0.7)
                    
                    VStack(alignment: .leading,spacing: 25){
                        Text(title)
                            .font(.titleLarge)
                            .fontWeight(.bold)
                            .foregroundStyle(.text)
                        VStack(alignment: .leading,spacing: 10) {
                            HStack {
                                Image(systemName: "star.fill")
                                    .font(.detailBase)
                                Text(NSNumber(value: voteAverage),formatter: doubleFormatter)
                                    .font(.detailBase)
                            }
                            .foregroundStyle(Color.star)
                            
                            HStack {
                                Image(systemName: "calendar")
                                    .font(.detailBase)
                                Text(releaseDate)
                                    .font(.detailBase)
                                    
                            }
                            .foregroundStyle(Color.textBase)
                        }
                    }
                }
            }
        }
        .padding(.horizontal,10)
        .onAppear(perform: {
            withAnimation(.linear(duration: 1)){
                isAnimating = true}
        })
        
    }
}

#Preview {
    SearchMovieItem(posterImage: "/rtosxP5sXuoRFPH4sVbMccLIPiV.jpg", voteRate:  6.516, releaseDate: "2023-12-13", title: "The Three Musketeers: Milady")
}

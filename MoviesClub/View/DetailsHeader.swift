//
//  DetailsHeader.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct DetailsHeader: View {
    //MARK: - PROPERTIES
    var movie: MovieDetail
    // MARK: - BODY
    var body: some View {
        VStack {
            MovieHeader(movie: movie)
                .padding(.vertical, 15)
                .padding(.horizontal, 15)
            
            MovieInfo(movie: movie)
                .foregroundStyle(Color.textBase)
                .padding(.horizontal, 10)
        }
    }
}

// MARK: - MovieHeader
struct MovieHeader: View {
    //MARK: - PROPERTIES
    var movie: MovieDetail
    
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 5) {
            if let imagePath = movie.posterPath, let title = movie.title {
                CustomImageView(imagePath: imagePath)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .frame(width: 140, height: 180)
                
                Text(title)
                    .font(.titleMedium)
                    .fontWeight(.heavy)
                    .lineLimit(2)
                    .offset(y: 35)
                    .shadow(color: .black, radius: 2)
                    .foregroundStyle(.text)
            }
            Spacer()
        }
    }
}

// MARK: - MovieInfo
struct MovieInfo: View {
    //MARK: - PROPERTIES
    var movie: MovieDetail
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 40) {
            MovieInfoItem(iconName: "calendar", text: movie.releaseDate)
            MovieInfoItem(iconName: "clock", text: "\(movie.runtime ?? 0) Minutes")
            MovieInfoItem(iconName: "ticket", text: movie.genres?.first?.name)
        }
    }
}

// MARK: - MovieInfoItem
struct MovieInfoItem: View {
    //MARK: - PROPERTIES
    var iconName: String
    var text: String?
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: iconName)
            if let text = text {
                Text(text)
                    .font(.caption2)
                    .shadow(color: .black, radius: 1)
                
            }
        }
    }
}

#Preview {
    DetailsHeader(movie: sampleMovieDetail)
}


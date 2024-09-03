//
//  DescriptionView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct DescriptionView: View {
    
    //MARK: - PROPERTIES
    var movie: MovieDetail
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading,spacing: 5){
            TitleView(title: "Overview", font: .titleMedium, addShadow: false)
            if let overview = movie.overview{
                DescriptionContentView(descriptionText: overview)
            }
            TitleView(title: "Tagline", font: .titleMedium, addShadow: false)
            
            if let tagline = movie.tagline{
                DescriptionContentView(descriptionText: tagline)
            }
            Spacer()
            
        }
        .clipShape(.rect(cornerRadius: 6))
        .padding(.horizontal,5)
        .foregroundStyle(.text)
    }
}

#Preview {
    DescriptionView(movie: sampleMovieDetail)
}


// MARK: - DescriptionContent
struct DescriptionContentView: View {
    
    //MARK: - PROPERTIES
    var descriptionText : String
    
    // MARK: - BODY
    var body: some View {
        Text(descriptionText)
            .font(.detailBase)
            .fontWeight(.medium)
            .lineLimit(6)
    }
}

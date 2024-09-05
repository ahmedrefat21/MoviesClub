//
//  PosterView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct PosterView: View {
    //MARK: - PROPERTIES
    var posterImage: String?
    var voteRate: Double?
    
    // MARK: - BODY
    var body: some View {
        VStack{
            if let imagePath = posterImage,let voteRate = voteRate{
                CustomImageView(imagePath: imagePath)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RateView(voteRate: voteRate)
                        ,alignment: .bottomTrailing

                    )
            }
        }
        
        
    }
}

#Preview {
    PosterView(posterImage: "/qGJASuD3fs9ZBxuEZoxCLVidVq8.jpg", voteRate: 6.516)
}


let sampleMovieDetail: MovieDetail = MovieDetail(
    backdropPath: "/qGJASuD3fs9ZBxuEZoxCLVidVq8.jpg",
    budget: 39000000,
    genres: [Genre(id: 12, name: "Adventure")],
    id: 845111,
    originalCountry: ["FR"],
    originalLanguage: "fr",
    originalTitle: "Les trois mousquetaires : Milady",
    overview: "D'Artagnan, on a quest to rescue the abducted Constance, runs into the mysterious Milady de Winter again. The tension between the Catholics and the Protestants finally escalates, as the king declares war — forcing the now four musketeers into battle. But as the war goes on, they are tested physically, mentally and emotionally.",
    popularity: 629.256,
    posterPath: "/rtosxP5sXuoRFPH4sVbMccLIPiV.jpg",
    releaseDate: "2023-12-13",
    runtime: 121,
    status: "Released",
    tagline: "The adventure continues, chaos ensues...",
    title: "The Three Musketeers: Milady",
    voteAverage: 6.516,
    voteCount: 394)

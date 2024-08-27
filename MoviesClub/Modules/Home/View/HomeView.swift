//
//  HomeView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 26/08/2024.
//

import SwiftUI

struct HomeView: View {
    // MARK: - BODY
    var body: some View {
        
        VStack(spacing:20){
            // MARK: - NavigationBar
            NavigationBarView()
                .padding(.top, 50)
                .background(BackgroundStyle
                    .navigationBackground)
                .clipShape(.rect(cornerRadius: 25))
                .shadow(color: .black.opacity(0.085), radius: 5, x: 0, y: 10)
            
            ScrollView(.vertical,showsIndicators: false){
                
                // MARK: - TopRatedList
                MovieSection(title: "Top Rated Movies", movies: [Constants().sampleMovie, Constants().sampleMovie], listType: .topRated)
                 
                // MARK: - NowPlayingList
                MovieSection(title: "Now Playing Movies", movies: [Constants().sampleMovie, Constants().sampleMovie], listType: .nowPlaying)
                 
                // MARK: - PopularList
                MovieSection(title: "Popular Movies", movies: [Constants().sampleMovie, Constants().sampleMovie], listType: .standart)
                // MARK: - UpcomingList
                MovieSection(title: "Upcoming Movies", movies: [Constants().sampleMovie, Constants().sampleMovie], listType: .standart)
            }
        }
                
        .background(BackgroundStyle.background)
        .ignoresSafeArea(.all,edges: .top)
    }
}

#Preview {
    HomeView()
}

// MARK: - MovieSection
struct MovieSection: View {
    var title: String
        var movies: [Movie]
        var listType: MovieListType
    var body: some View {
        VStack (alignment: .leading){
            TitleView(title: title)
                .padding(.leading,10)
            
            MovieList(movies: movies, listType: listType)
        }
        .padding(.bottom,20)
    }
}


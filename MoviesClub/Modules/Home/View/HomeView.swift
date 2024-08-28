//
//  HomeView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 26/08/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var handler: HomeViewHandler = .init()
    // MARK: - BODY
    var body: some View {
        
        VStack(spacing:20){
        
            homeHeader
            ScrollView(.vertical,showsIndicators: false){
                // MARK: - ErrorView
                if let errorMessage = handler.errorMessage {
                    ErrorView(errorMessage: errorMessage)
                   
                } else {
                    
                    // MARK: - TopRatedList
                    TopRatedList(movies:  handler.topRatedMovies)
                    
                    // MARK: - NowPlayingList
                    NowPlayingList(movies: handler.nowPlayingMovies)
                    
                    // MARK: - PopularList
                    StandardList(title: "Popular Movies", movies: handler.popularMovies)
                    
                    // MARK: - UpcomingList
                    StandardList(title: "Upcoming Movies", movies: handler.upcomingMovies)
                }
                
                
            }
        }
        
        .background(BackgroundStyle.background)
    }
}

#Preview {
    HomeView()
}

// MARK: - HomeHeader
private var homeHeader: some View {
    HStack {
        Spacer()
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 40,height:40,alignment: .center)
        Text("Movies club")
            .font(.titleMedium)
            .fontWeight(.black)
            .foregroundStyle(Color.textBase)
            .shadow(color: .black, radius: 2)
        Spacer()
    }
}




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
        
            homeHeader
            ScrollView(.vertical,showsIndicators: false){
                
                // MARK: - TopRatedList
                TopRatedList(movies:  [Constants().sampleMovie, Constants().sampleMovie])
                
                // MARK: - NowPlayingList
                NowPlayingList(movies: [Constants().sampleMovie, Constants().sampleMovie])
                 
                // MARK: - PopularList
                StandardList(title: "Popular Movies", movies: [Constants().sampleMovie, Constants().sampleMovie])
            
                // MARK: - UpcomingList
                StandardList(title: "Upcoming Movies", movies: [Constants().sampleMovie, Constants().sampleMovie])
                
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




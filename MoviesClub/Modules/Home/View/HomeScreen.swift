//
//  HomeView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 26/08/2024.
//

import SwiftUI

struct HomeScreen: View {
    
    // MARK: - BODY
    var body: some View {
        
        NavigationView {
            VStack(spacing:20){
                homeHeader
                ScrollView(.vertical,showsIndicators: false){
                    // MARK: - TopRatedList
                    TopRatedList()
                    
                    // MARK: - NowPlayingList
                    NowPlayingList()
                    
                    // MARK: - PopularList
                    PopularView()
                    
                    // MARK: - UpcomingList
                    UpcomingView()
                }
            }
            .background(BackgroundStyle.background)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeScreen()
}

// MARK: - HomeHeader
private var homeHeader: some View {
    HStack {
        Spacer()

        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40, alignment: .center)

        Text("Movies Club")
            .font(.titleMedium)
            .fontWeight(.black)
            .foregroundStyle(Color.textBase)
            .shadow(color: .black, radius: 2)

        Spacer()

        NavigationLink(destination: SearchView()) {
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .foregroundStyle(Color.textBase)
                .padding(.trailing, 15)
        }
    }
}





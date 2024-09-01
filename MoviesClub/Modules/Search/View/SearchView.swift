//
//  SearchView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 29/08/2024.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: - Properties
    @StateObject var handler: SearchViewHandler = .init()
    @Environment(\.presentationMode) private var presentationMode

    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            CustomBarView()
            TitleView(title: "Search", font: .largeTitle, addShadow: true)
                .padding(15)
            
            CustomSearchTextField(searchTerm: $handler.searchTerm)
            VStack {
                switch handler.state {
                case .initial:
                    Spacer()
                    EmptyListView(message: "Please enter your movie you want to search for")
                        .padding(.horizontal, 100)
                    Spacer()
                case .loading:
                    Spacer()
                    LoadingView(message: "Loading movies...")
                        .padding(.horizontal, 110)
                    Spacer()
                case .emptySearchResults:
                    Spacer()
                    EmptyListView(message: "We are sorry, we cannot find the movie")
                        .padding(.horizontal, 100)
                    Spacer()
                case .searchedMovies:
                    SearchMovieList(movies: handler.searchedMovies)
                }
                
            }
            
            //Spacer()
            
        }
        .background(BackgroundStyle.background)
        .navigationBarHidden(true)
        .overlay{
            if let errorMessage = handler.errorMessage {
                VStack {
                    ErrorView(errorMessage: errorMessage)
                    Spacer()
                }
            }
        }
        
    }
}

#Preview {
    SearchView()
}

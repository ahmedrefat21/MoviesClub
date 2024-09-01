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
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                //CustomBarView()
                detailsBar
                TitleView(title: "Search", font: .largeTitle, addShadow: true)
                    .padding(15)

                CustomSearchTextField(searchTerm: $handler.searchTerm)

                VStack {
                    if !handler.isComplete {
                        Spacer()
                        EmptyListView()
                            .padding(.horizontal, 100)
                        Spacer()
                    } else {
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
        .navigationBarHidden(true)
        
    }

    
    
    // MARK: - COMPONENTS
    private var detailsBar: some View {
        HStack {
            backButton
            Spacer()
        }
        .padding(.horizontal, 15)
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward")
                    .foregroundStyle(Color.textBase)
                    .font(.titleLarge)

            }
        }
    }

}

#Preview {
    SearchView()
}

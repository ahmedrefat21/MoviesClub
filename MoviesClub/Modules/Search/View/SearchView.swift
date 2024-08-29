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
    @State private var searchTerm: String = ""
    @State private var isComplete: Bool = false

    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                //CustomBarView()
                detailsBar
                TitleView(title: "Search", font: .largeTitle, addShadow: true)
                    .padding(15)

                customSearchTextField

                VStack {
                    if !isComplete {
                        Spacer()
                        EmptyListView()
                            .padding(.horizontal, 100)
                        Spacer()
                    } else {
                        SearchMovieList(movies: handler.searchedMovies)
                    }
                }

                Spacer()
            }
            .background(BackgroundStyle.background)
            
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

    // MARK: - SearchTextField
    private var customSearchTextField: some View {
        TextField("Search", text: $searchTerm)
            .onChange(of: searchTerm) { newValue in
                Task {
                    await handler.getMovies(query: newValue)
                    withAnimation(.linear(duration: 1)) {
                        isComplete = !newValue.isEmpty
                    }
                }
            }
            .font(.titleMedium)
            .padding(.horizontal, 15)
            .foregroundStyle(Color.textBase)
            .frame(height: 45)
            .background(RoundedRectangle(cornerRadius: 16)
                .fill(Color.lightBackground.opacity(0.5))
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.textStrokeBase, lineWidth: 2)
                ))
            .textFieldStyle(DefaultTextFieldStyle())
            .padding()
            .overlay(
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundStyle(Color.textBase)
                    .padding(.horizontal, 25),
                alignment: .trailing
            )
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

//
//  DetailView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) private var presentationMode
    let movieId: Int
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            
            CustomBarView()
            ScrollView(.vertical, showsIndicators: false) {
                DetailsContentView( movieId: movieId)
                CastsList(movieId: movieId)
                SimiliarMoviesView(movieId: movieId)
            }
        }
        .background(BackgroundStyle.background)
        .navigationBarHidden(true)
    }
}

#Preview {
    DetailView(movieId: 845111)
}


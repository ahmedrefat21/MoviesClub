//
//  DetailView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct DetailScreen: View {
    
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) private var presentationMode
    let movieId: Int
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            
            CustomBarView()
            ScrollView(.vertical, showsIndicators: false) {
                DetailsWidget( movieId: movieId)
                CastsListWidget(movieId: movieId)
                SimiliarWidget(movieId: movieId)
            }
        }
        .background(BackgroundStyle.background)
        .navigationBarHidden(true)
    }
}

#Preview {
    DetailScreen(movieId: 845111)
}


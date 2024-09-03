//
//  PopularView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 03/09/2024.
//

import SwiftUI

struct PopularView: View {
    @StateObject private var handler: PopularHandler = .init()
    var body: some View {
        if handler.errorMessage == nil {
            StandardList(title: "Popular Movies", movies: handler.popularMovies,font: .titleLarge)
        }
    }
}

#Preview {
    PopularView()
}

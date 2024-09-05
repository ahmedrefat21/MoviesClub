//
//  UpcomingView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 03/09/2024.
//

import SwiftUI

struct UpcomingWidget: View {
    
    @StateObject private var handler: UpcomingHandler = .init()
    var body: some View {
        if handler.errorMessage == nil {
            StandardList(title: "Upcoming Movies", movies: handler.upcomingMovies ,font: .titleLarge)
        }
    }
}

#Preview {
    UpcomingWidget()
}

//
//  TitleView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 26/08/2024.
//

import SwiftUI

struct TitleView: View {
    // MARK: - PROPERTIES
    var title: String
    // MARK: - BODY
    var body: some View {
        Text(title)
            .font(.titleLarge)
            .fontWeight(.black)
            .shadow(color: .gray,radius: 2)
            .foregroundStyle(.text)
    }
}

#Preview {
    TitleView(title: "Top Rated Movies")
}

//
//  TitleView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 26/08/2024.
//

import SwiftUI

//struct TitleView: View {
//    // MARK: - PROPERTIES
//    var title: String
//    // MARK: - BODY
//    var body: some View {
//        Text(title)
//            .font(.titleLarge)
//            .fontWeight(.black)
//            .shadow(color: .gray,radius: 2)
//            .foregroundStyle(.text)
//    }
//}
//
//#Preview {
//    TitleView(title: "Top Rated Movies")
//}


struct TitleView: View {
    // MARK: - PROPERTIES
    var title: String
    var font: Font
    var addShadow: Bool
    
    // MARK: - BODY
    var body: some View {
        Text(title)
            .font(font)
            .fontWeight(.black)
            .foregroundStyle(.text)
            .shadow(color: .gray, radius: addShadow ? 2 : 0)
    }
}

#Preview {
    VStack {
        TitleView(title: "Top Rated Movies", font: .titleLarge, addShadow: true)
        TitleView(title: "Cast", font: .titleMedium, addShadow: false)
    }
}

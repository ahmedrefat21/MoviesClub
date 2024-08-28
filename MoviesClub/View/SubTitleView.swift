//
//  SubTitleView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct SubTitleView: View {
    //MARK: - PROPERTIES
    var title: String
    
    // MARK: - BODY
    var body: some View {
        Text(title)
            .font(.titleMedium)
            .fontWeight(.black)
            .foregroundStyle(.text)
            
    }
}

#Preview {
    SubTitleView(title: "cast")
}


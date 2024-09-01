//
//  EmptyListView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 29/08/2024.
//

import SwiftUI

struct EmptyListView: View {
    
    // MARK: - Properties
        var message: String
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Image("searchIcon")
                .resizable()
                .scaledToFit()
            .frame(width: 100,height: 100)
            .padding(.bottom, 20)
            Text(message)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.text)
        }
    }
}

#Preview {
    EmptyListView(message: "we are sorry, we can not find the movie ")
}

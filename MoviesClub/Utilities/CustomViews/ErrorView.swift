//
//  ResultView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 28/08/2024.
//

import SwiftUI



struct ErrorView: View {

    // MARK: - Variables
    var errorMessage: String

    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "exclamationmark.triangle")
                    .foregroundColor(.red)
                    .font(.title)
                
                Text(errorMessage)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 8)
                
                Spacer()
            }
            .padding()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}

#Preview {
    ErrorView(errorMessage: "An error occurred. Please try again.")
}

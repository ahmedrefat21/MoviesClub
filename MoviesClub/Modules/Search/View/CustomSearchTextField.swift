//
//  CustomSearchTextField.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 01/09/2024.
//

import SwiftUI

struct CustomSearchTextField: View {

    // MARK: - Properties
    @Binding var searchTerm: String

    var body: some View {
        TextField("Search", text: $searchTerm)
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
}

#Preview {
    CustomSearchTextField(searchTerm: .constant(""))
}

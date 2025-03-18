//
//  CustomBarView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 29/08/2024.
//

import SwiftUI

struct CustomBarView: View {
    
    // MARK: - Properties
    @Environment(\.presentationMode) private var presentationMode

        
    // MARK: - Body
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .foregroundStyle(Color.textBase)
            }
            .accessibilityIdentifier("backButton")
            
            Spacer()
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
    }
}

#Preview {
    CustomBarView()
}

//
//  CustomBarView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 29/08/2024.
//

import SwiftUI

struct CustomBarView: View {
    
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode

        
    // MARK: - Body
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(Color.textBase)
                        .font(.titleLarge)
                }
            }
            Spacer()
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    CustomBarView()
}

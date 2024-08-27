//
//  DetailView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) private var presentationMode
    let movieId: Int
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            detailsBar
            
        }
        .background(BackgroundStyle.background)
        
    }
    
    // MARK: - COMPONENTS
    private var detailsBar: some View {
        HStack {
            backButton
            Spacer()
        }
        .padding(.horizontal, 15)
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward")
                    .foregroundStyle(Color.textBase)
                    .font(.titleLarge)

            }
        }
    }
    
    
}

#Preview {
    DetailView(movieId: 845111)
}


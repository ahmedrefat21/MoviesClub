//
//  RateView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct RateView: View {
    //MARK: - PROPERTIES
    var voteRate: Double
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing:15) {
            Image(systemName: "star.fill" )
            
            Text(NSNumber(value:voteRate),formatter: doubleFormatter)
        }
        .font(.titleMedium)
        .foregroundStyle(Color.star)
        .padding(.horizontal,10)
        .padding(.vertical,5)
        .background(BackgroundStyle.navigationBackground)
        .clipShape(.rect(cornerRadius: 16))
        .padding(.bottom,15)
        .padding(.trailing,15)
        
        
    }
}


#Preview {
    RateView(voteRate: 4.0)
}


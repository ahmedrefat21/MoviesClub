//
//  CastsList.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct CastsList: View {
    //MARK: - PROPERTIES
    var casts: [Casts]
    
    // MARK: - BODY
    var body: some View {
        VStack (alignment: .leading){
            TitleView(title: "Cast", font: .titleMedium, addShadow: false)
                .padding(.leading,10)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(casts.indices,id:\.self) { index in
                        CastListItem(cast: casts[index])
                    }
                }
            }
        }
    }
}



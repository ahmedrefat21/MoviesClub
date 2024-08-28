//
//  CastListItem.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct CastListItem: View {
    //MARK: - PROPERTIES
    var cast: Casts
    
    // MARK: - BODY
    var body: some View {
        if let imagePath = cast.profilePath {
            CustomImageView(imagePath: imagePath)
                  .frame(width: 100, height: 100)
                  .clipShape(Circle())
                  .padding(.horizontal,10)
                  
        }
    }
    
}

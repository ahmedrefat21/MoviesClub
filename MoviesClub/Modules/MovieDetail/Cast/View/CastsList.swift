//
//  CastsList.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import SwiftUI

struct CastsList: View {
    
    @StateObject private var handler: CastHandler = .init()
    //MARK: - PROPERTIES
    let movieId: Int
    
    // MARK: - BODY
    var body: some View {
        if handler.errorMessage == nil {
            VStack (alignment: .leading){
                TitleView(title: "Cast", font: .titleMedium, addShadow: false)
                    .padding(.leading,10)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(handler.casts.indices,id:\.self) { index in
                            CastListItem(cast: handler.casts[index])
                        }
                    }
                }
            }
            .onAppear{
                Task {
                    await handler.getCasts(withId: movieId)
                }
                
            }
        }
    }
}



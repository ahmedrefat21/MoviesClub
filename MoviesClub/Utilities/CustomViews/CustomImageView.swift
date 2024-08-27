//
//  CustomImageView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 26/08/2024.
//

import SwiftUI

struct CustomImageView: View {
    //MARK: - PROPERTIES
    var imagePath: String
    
    //MARK: - BODY
    var body: some View {
        VStack {
            
            AsyncImage(url: URL(string:MovieURL.baseImageURLString+imagePath))
            {phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    CustomImageView(imagePath: "hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg")
}

//
//  StrokeText.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 26/08/2024.
//

import SwiftUI

struct StrokeText: View {
    //MARK: - PROPERTIES
    let text: String
    let width: CGFloat
    let color: Color
    
    //MARK: - BODY
    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}

#Preview {
    StrokeText(text: "1", width: 0.75, color: Color.textStrokeBase)
}


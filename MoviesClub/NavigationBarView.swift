//
//  NavigationBarView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 26/08/2024.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        HStack {
            Spacer()
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 40,height:40,alignment: .center)
            Text("Movies")
                .font(.titleMedium)
                .fontWeight(.black)
                .foregroundStyle(Color.textBase)
                .shadow(color: .black, radius: 2)
            
            Text("Club")
                .font(.titleMedium)
                .fontWeight(.black)
                .foregroundStyle(Color.textBase)
                .shadow(color: .black, radius: 2)
            Spacer()
        }

    }
}

#Preview {
    NavigationBarView()
}

//
//  LoadingView.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 01/09/2024.
//

import SwiftUI

struct LoadingView: View {
    var message: String?

    var body: some View {
        VStack {
            ProgressView()
                .scaleEffect(1.5, anchor: .center)
                .padding(.bottom, 20)
                .progressViewStyle(CircularProgressViewStyle(tint: .textStroke))
            
            if let message = message {
                Text(message)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.textStroke)

            }
        }
        .padding()
    }
}

#Preview {
    LoadingView(message: "Loading...")
}


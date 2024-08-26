//
//  BackgroundStyle.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 26/08/2024.
//

import SwiftUI
extension BackgroundStyle {
    static let background = LinearGradient(
        colors: [Color.backgroundDark,Color.backgroundMedium,Color.backgroundLight],
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    static let navigationBackground = LinearGradient(
        colors: [Color.backgroundLight,Color.backgroundMedium,Color.backgroundDark],
        startPoint: .top,
        endPoint: .bottom)
}

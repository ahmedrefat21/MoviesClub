//
//  MoviesClubApp.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 24/08/2024.
//

import SwiftUI

@main
struct MoviesClubApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeScreen()
        }
    }
}

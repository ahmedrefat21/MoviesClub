//
//  Credit.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import Foundation

struct Credit: Decodable{
    let id: Int
    let cast: [Casts]
}

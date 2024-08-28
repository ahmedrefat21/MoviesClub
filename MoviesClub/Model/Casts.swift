//
//  Casts.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 27/08/2024.
//

import Foundation


import Foundation
struct Casts: Decodable{
   
    let profilePath: String?
    
    
    enum CodingKeys: String, CodingKey {
        case profilePath = "profile_path"
    }
}

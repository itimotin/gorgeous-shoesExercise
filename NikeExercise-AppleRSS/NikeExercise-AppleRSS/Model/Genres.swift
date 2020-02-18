//
//  Genres.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/17/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import Foundation

struct Genre : Decodable {
    let id   : String?
    let name : String?
    let url  : URL?
    
    enum CodingKeys: String, CodingKey {
        case id = "genreId"
        case name
        case url
    }
}

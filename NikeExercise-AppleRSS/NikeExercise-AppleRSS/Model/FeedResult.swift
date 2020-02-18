//
//  Result.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/17/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import Foundation

struct FeedResult : Decodable {
    let title : String?
    //id
    //author {name, uri}
    //links[]
    //copyright
    //country
    //icon
    //updated
    let albums  : [Album]?
    
    enum CodingKeys : String, CodingKey {
        case title
        case albums = "results"
    }
}

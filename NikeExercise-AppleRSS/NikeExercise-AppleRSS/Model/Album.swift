//
//  Album.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/17/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import Foundation

struct Album : Decodable {
    let artistName  : String?
    let id          : String?
    let releaseDate : String?
    let name        : String?
    let kind        : String?
    let copyRight   : String?
    let artistId    : String?
    
    let contentRating   : String?
    let artistUrl       : String?
    let artWorkUrl      : String?
    let url             : String?
    let genres          : [Genre]?
    
    enum CodingKeys : String, CodingKey {
        case artistName
        case id
        case releaseDate
        case name
        case kind
        case artistId
        case artistUrl
        case url
        case genres
        case copyRight      = "copyright"
        case contentRating  = "contentAdvisoryRating"
        case artWorkUrl     = "artworkUrl100"
    }
    
}

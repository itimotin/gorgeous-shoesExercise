//
//  JSONResponse.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/17/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import Foundation

struct JSONResponse : Decodable{
    let feed: FeedResult?
}

//
//  Result.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/17/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import Foundation

enum Result<T, E:Error> {
    case success(T)
    case failure(E)
}

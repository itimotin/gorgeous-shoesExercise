//
//  ErrorResult.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/17/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}

//
//  ParserHelper.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/17/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import Foundation

final class ParserHelper {
    
    static func parse<T: Decodable>(data: Data, completion: (Result<[T], ErrorResult>) -> Void) {
        do {
            let decoder = JSONDecoder()
            let tObject = try decoder.decode([T].self, from: data)

            completion(.success(tObject))
            
        } catch {
            completion(.failure(.parser(string: "Error while parsing json data")))
        }
    }


    static func parse<T: Decodable>(data: Data, completion : (Result<T, ErrorResult>) -> Void) {
        do {

            let decoder = JSONDecoder()
            let tObject = try decoder.decode(T.self, from: data)
            completion(.success(tObject))
            
        } catch {
            completion(.failure(.parser(string: "Error while parsing json data")))
        }
    }

}

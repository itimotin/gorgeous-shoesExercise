//
//  RequestService.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/17/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import Foundation

final class RequestService {
    
    //todo add model
    func loadData(urlString: String, session: URLSession = URLSession(configuration: .default), completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask? {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.network(string: "Wrong url format")))
            return nil
        }
        
        var request = RequestFactory.request(method: .GET, url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.network(string: "An error occured during request :" + error.localizedDescription)))
                return
            }
            
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
        return task
    }
}

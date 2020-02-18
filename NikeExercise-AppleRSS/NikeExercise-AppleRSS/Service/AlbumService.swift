//
//  AlbumService.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/17/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import Foundation

protocol AlbumServiceProtocol : class {
    func fetchAlbums(_ completion: @escaping ((Result<JSONResponse, ErrorResult>) -> Void))
}

final class AlbumService : RequestHandler, AlbumServiceProtocol {
    
    static let shared = AlbumService()
    
    let endpoint = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json"
    var task : URLSessionTask?
    
    func fetchAlbums(_ completion: @escaping ((Result<JSONResponse, ErrorResult>) -> Void)) {
        
        // cancel previous request if already in progress
        self.cancelFetchAlbums()
        
        task = RequestService().loadData(urlString: endpoint, completion: self.networkResult(completion: completion))
    }
    
    func cancelFetchAlbums() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}

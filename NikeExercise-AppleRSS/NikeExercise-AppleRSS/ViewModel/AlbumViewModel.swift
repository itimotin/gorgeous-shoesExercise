//
//  AlbumViewModel.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/17/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import Foundation
struct AlbumViewModel {
    
    weak var dataSource : GenericDataSource<Album>?
    weak var service: AlbumServiceProtocol?
    
    var onErrorHandling : ((ErrorResult?) -> Void)?
    
    init(service: AlbumServiceProtocol = AlbumService.shared, dataSource : GenericDataSource<Album>?) {
        self.dataSource = dataSource
        self.service = service
    }
    
    func fetchAlbums() {
        
        guard let service = service else {
            onErrorHandling?(ErrorResult.custom(string: "Missing service"))
            return
        }
        
        service.fetchAlbums { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response) :
                    if let albums = response.feed?.albums {
                        self.dataSource?.data.value = albums
                    }
                case .failure(let error) :
                    self.onErrorHandling?(error)
                }
            }
        }
    }
}

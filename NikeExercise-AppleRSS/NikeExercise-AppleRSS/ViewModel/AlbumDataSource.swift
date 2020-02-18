//
//  AlbumDataSource.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/17/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import Foundation
import UIKit
class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class AlbumDataSource : GenericDataSource<Album>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.identifier, for: indexPath) as! AlbumCell
        
        let album = self.data.value[indexPath.row]
        cell.configure(with: album)
        
        return cell
    }
    
}

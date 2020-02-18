//
//  ViewController.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/17/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import UIKit

class AlbumTableViewController: UITableViewController {
    let dataSource = AlbumDataSource()
    
    lazy var viewModel : AlbumViewModel = {
        let viewModel = AlbumViewModel(dataSource: dataSource)
        return viewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Albums"
        
        
        self.tableView.dataSource = self.dataSource
        self.tableView.register(AlbumCell.self, forCellReuseIdentifier: AlbumCell.identifier)
        
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        self.viewModel.onErrorHandling = { [weak self] error in
                   // display error ?
                   let controller = UIAlertController(title: "An error occured", message: "Oops, something went wrong!", preferredStyle: .alert)
                   controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
                   self?.present(controller, animated: true, completion: nil)
               }
               
        self.viewModel.fetchAlbums()
        self.tableView.rowHeight = 80
        }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.album = self.dataSource.data.value[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}


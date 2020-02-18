//
//  AlbumCell.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/17/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import Foundation
import UIKit


///Each cell should display the name of the album, the artist, and the album art (thumbnail image).
class AlbumCell : UITableViewCell {
    static let identifier = "albumCellIdentifier"
    
    var lblArtistName : UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var lblAlbumName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var thumbnailImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 8, y: 0, width: 80, height: 80))
//        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "music.note")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(lblAlbumName)
        self.addSubview(lblArtistName)
        self.addSubview(thumbnailImageView)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0(80@250)]-[v1]-|", options: .init(), metrics: nil, views: ["v0": self.thumbnailImageView, "v1": lblArtistName] ))
        NSLayoutConstraint(item: self.lblAlbumName, attribute: .left, relatedBy: .equal, toItem: self.lblArtistName, attribute: .left, multiplier: 1, constant: 0).isActive = true
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(80@250)]", options: .init(), metrics: nil, views: ["v0": self.thumbnailImageView]))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0]-[v1]", options: .init(), metrics: nil, views: ["v0": self.lblAlbumName,"v1": self.lblArtistName]))
    }
    
    func configure(with album: Album) {
        self.lblArtistName.text = album.artistName
        self.lblAlbumName.text = album.name
        if let url = album.artWorkUrl {
            self.thumbnailImageView.downloadImageFrom(source: url, contentMode: .scaleAspectFit)
        }
    }
}

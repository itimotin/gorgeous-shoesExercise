//
//  DetailViewController.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/18/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController {
    var album : Album? = nil
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
    
    
    var lblCopyRight : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var buttonRedirect: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("iTunes Store", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.addTarget(self, action:Selector(("showITunesPage")), for: .touchUpInside)
        return button
    }()
    
    
    var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "music.note")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.lblArtistName.text = self.album?.artistName
        self.lblAlbumName.text = self.album?.name
        if let url = album?.artWorkUrl {
            self.thumbnailImageView.downloadImageFrom(source: url, contentMode: .scaleAspectFit)
        }
        
        self.view.addSubview(self.lblArtistName)
        self.view.addSubview(self.lblAlbumName)
        self.view.addSubview(self.thumbnailImageView)
        self.view.addSubview(self.buttonRedirect)
        self.view.addSubview(self.lblCopyRight)
        self.setUpViewContraints()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension DetailViewController {
    func setUpViewContraints() {
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v0(300@250)]-50-|", options: [.alignAllCenterX], metrics: nil, views: ["v0": self.thumbnailImageView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[v0(300@250)]|", options: [.init()], metrics: nil, views: ["v0": self.thumbnailImageView]))
        
        NSLayoutConstraint(item: self.lblAlbumName, attribute: .left, relatedBy: .equal, toItem: self.lblArtistName, attribute: .left, multiplier: 1, constant: 0).isActive = true
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]", options: .init(), metrics: nil, views: ["v0": self.lblAlbumName]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[v0]-[v1]", options: .init(), metrics: nil, views: ["v0": self.lblAlbumName,"v1": self.lblArtistName]))
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0]-20-|", options: .alignAllBottom, metrics: nil, views: ["v0": self.buttonRedirect]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: .alignAllCenterX, metrics: nil, views: ["v0": self.buttonRedirect]))
    }
    
    @objc func showITunesPage() {
        if let stringUrl = self.album?.url, let url = URL(string: stringUrl) {
            UIApplication.shared.open(url)
        }
    }
}

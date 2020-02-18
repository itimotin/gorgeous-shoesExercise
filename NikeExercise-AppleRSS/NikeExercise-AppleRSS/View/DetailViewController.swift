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
    
    var buttonRedirect: UIButton = {
        let button = UIButton()
        button.setTitle("iTunes Store", for: .normal)
        button.addTarget(self, action:Selector(("showITunesPage")), for: .touchUpInside)
        return button
    }()
    
      
    var thumbnailImageView: UIImageView = {
            let imageView = UIImageView(frame: CGRect(x: 50, y: 50, width: 80, height: 80))
    //        let imageView = UIImageView()
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
        
        self.view.addSubview(lblArtistName)
        self.view.addSubview(lblAlbumName)
        self.view.addSubview(self.thumbnailImageView)
        self.view.addSubview(self.buttonRedirect)
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v0(300@250)]-[v1]-|", options: .init(), metrics: nil, views: ["v0": self.thumbnailImageView, "v1": lblArtistName] ))
        
        NSLayoutConstraint(item: self.lblAlbumName, attribute: .left, relatedBy: .equal, toItem: self.lblArtistName, attribute: .left, multiplier: 1, constant: 0).isActive = true
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[v0(300@250)]", options: .init(), metrics: nil, views: ["v0": self.thumbnailImageView]))
               
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0]-[v1]", options: .init(), metrics: nil, views: ["v0": self.lblAlbumName,"v1": self.lblArtistName]))
        
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0]-20-|", options: .init(), metrics: nil, views: ["v0": self.buttonRedirect]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: .alignAllCenterX, metrics: nil, views: ["v0": self.buttonRedirect]))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
extension DetailViewController {
    @objc func showITunesPage() {
        if let stringUrl = self.album?.url, let url = URL(string: stringUrl) {
            UIApplication.shared.open(url)
        }
    }
}

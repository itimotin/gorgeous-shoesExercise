//
//  UIImageView+DownloadImage.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/18/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadImageFrom(source urlString:String, contentMode:ContentMode) {
        guard let url = URL(string: urlString) else {
            fatalError("invalid url")
        }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode = contentMode
                if let data = data {
                    self.image = UIImage(data: data)
                }
            }
        }).resume()
        
    }
    
}

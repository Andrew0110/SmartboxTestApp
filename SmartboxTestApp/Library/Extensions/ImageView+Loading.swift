//
//  SetImage.swift
//  vocrm
//
//  Created by Andrew on 9/11/18.
//  Copyright © 2018 nodeads. All rights reserved.
//

import UIKit

extension UIImageView {
    static let imageCache = NSCache<NSString, UIImage>()
    
    func setImage(imageURL: String, completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: imageURL) else { return }
        
        if let cachedImage = UIImageView.imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                if let imageToCache = UIImage(data: data) {
                    UIImageView.imageCache.setObject(imageToCache, forKey: url.absoluteString as NSString)
                    completion(imageToCache)
                }
                }.resume()
        }
        
    }
}

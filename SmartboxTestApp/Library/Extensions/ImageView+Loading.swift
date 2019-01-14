//
//  SetImage.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
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

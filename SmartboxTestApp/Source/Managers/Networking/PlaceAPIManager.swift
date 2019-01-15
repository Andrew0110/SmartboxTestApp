//
//  PlaceAPIManager.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class PlaceAPIManager: NSObject {
    static let instance = PlaceAPIManager()
    
    private override init() {
        super.init()
    }
    
    func getTTPlaces(completion: @escaping ([Place]?, Error?) -> ()) {
        let url = Constants.BASE_URL
        APIManager.GET(urlString: url) { (data, error) in
            guard let data = data else {
                completion(nil, error)
                return
            }
            let decoder = JSONDecoder()
            
            do {
                let decoded = try decoder.decode([Place].self, from: data)
                completion(decoded, nil)
            } catch let err {
                completion(nil, err)
            }
        }
    }
}

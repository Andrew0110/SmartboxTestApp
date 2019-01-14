//
//  TTPlaceAPIManager.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class TTPlaceAPIManager: NSObject {
    static let instance = TTPlaceAPIManager()
    
    private override init() {
        super.init()
    }
    
    func getTTPlaces(completion: @escaping ([TTPlace]?, Error?) -> ()) {
        let url = Constants.BASE_URL
        APIManager.GET(urlString: url) { (data, error) in
            guard let data = data else {
                completion(nil, error)
                return
            }
            let decoder = JSONDecoder()
            
            do {
                let decoded = try decoder.decode([TTPlace].self, from: data)
                completion(decoded, nil)
            } catch {
                print("Failed to decode JSON")
            }
        }
    }
}

//
//  APIManager.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import Foundation

class APIManager {
    
    static func GET(urlString: String, headers: [String:String]? = [:], parameters: [String:Any]? = [:], completion: @escaping (Data?, Error?) -> ()) {
        let url = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        var request = URLRequest(url: URL(string: url!)!)
        request.httpMethod = "GET"
        var allHeaders = basicHeaders()
        allHeaders.merge(other: headers!)
        for (key, value) in allHeaders {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(nil, error)
                return
            }
            completion(data, nil)
        }.resume()
    }
    
    fileprivate static func basicHeaders() -> [String:String] {
        return ["Content-Type" : "application/json"]
    }
}

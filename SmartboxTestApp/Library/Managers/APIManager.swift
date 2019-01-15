//
//  APIManager.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import Foundation

enum APIError: String, LocalizedError {
    case incorrectUrlError = "Incorrect URL"
    
    public var errorDescription: String? {
        return self.rawValue
    }
}

class APIManager {
    
    static func GET(urlString: String, headers: [String: String] = [:], completion: @escaping (Data?, Error?) -> ()) {
        guard
            let urlEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: urlEncoded) else {
                completion(nil, APIError.incorrectUrlError)
                return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        var allHeaders = basicHeaders()
        allHeaders.merge(other: headers)
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
    
    private static func basicHeaders() -> [String:String] {
        return ["Content-Type" : "application/json"]
    }
}

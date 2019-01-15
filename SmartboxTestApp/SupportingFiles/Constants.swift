//
//  Constants.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

struct Constants {
    // MARK: - API URL
    static let BASE_URL = "http://smartbox.software/tt/TT.json"

    // MARK: - Errors
    static let kErrorJSON = "Error serializing json"
    
    // MARK: - Alert
    struct AlertTexts {
        static let ok = "Ok"
        static let cancel = "Cancel"
        static let error = "Ошибка"
    }
    
}

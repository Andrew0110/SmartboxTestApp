//
//  TTItem.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import Foundation

enum PlaceType: String, Decodable {
    case event
    case shop
}

struct Place: Decodable {
    let id: Int
    let type: PlaceType
    let title: String
    let shortDescription: String
    let description: String
    let smallImage: String
    let bigImage: String
    let latitude: String
    let longitude: String
}


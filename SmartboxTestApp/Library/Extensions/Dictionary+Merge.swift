//
//  Dictionary+Merge.swift
//  vocrm
//
//  Created by Andrew on 8/29/18.
//  Copyright © 2018 nodeads. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func merge(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}

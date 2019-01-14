//
//  TTPlacesStore.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class TTPlacesStore: NSObject {
    static let instance = TTPlacesStore()
    
    private var events = [TTPlace]()
    private var shops = [TTPlace]()

    private override init() {
        super.init()
    }
    
//  MARK: - Public Methods
    func setPlaces(_ places:[TTPlace]?) {
        events = [TTPlace]()
        shops = [TTPlace]()
        guard let places = places else { return }
        places.forEach{
            switch $0.type {
            case .event:
                events.append($0)
            case .shop:
                shops.append($0)
            }
        }
    }
    
    func getPlaces(with type:TTPlaceType) -> [TTPlace] {
        switch type {
        case .event:
            return events
        case .shop:
            return shops
        }
    }
}

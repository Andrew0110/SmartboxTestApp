//
//  PlacesStore.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class PlacesStore: NSObject {
    static let instance = PlacesStore()
    
    private var events = [Place]()
    private var shops = [Place]()

    private override init() {
        super.init()
    }
    
    //  MARK: - Public Methods
    func setPlaces(_ places:[Place]?) {
        events = [Place]()
        shops = [Place]()
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
    
    func getPlaces(with type:PlaceType) -> [Place] {
        switch type {
        case .event:
            return events
        case .shop:
            return shops
        }
    }
}

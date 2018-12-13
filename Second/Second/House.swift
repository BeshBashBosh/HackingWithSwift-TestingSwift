//
//  House.swift
//  Second
//
//  Created by beshbashbosh on 13/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import Foundation

struct House {
    var bedrooms: Int
    var bathrooms: Int
    var cost: Int
    
    init(bedrooms: Int, bathrooms: Int) {
        self.bedrooms = bedrooms
        self.bathrooms = bathrooms
        self.cost = bedrooms + bathrooms * 50_000
    }
    
    func checkSuitability(desiredBedrooms: Int, desiredBathrooms: Int) -> Bool {
        return bedrooms >= desiredBedrooms && bathrooms >= desiredBathrooms
    }
    
}

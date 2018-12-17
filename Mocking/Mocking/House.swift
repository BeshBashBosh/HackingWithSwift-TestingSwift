//
//  House.swift
//  Mocking
//
//  Created by Benjamin Hall on 17/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import Foundation

protocol HouseProtocol {
    var numberOfViewings: Int { get set }
    func conductViewing()
}

class House: HouseProtocol {
    var numberOfViewings = 0
    
    func conductViewing() {
        numberOfViewings += 1
    }
}

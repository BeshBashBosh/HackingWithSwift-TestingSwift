//
//  Buyer.swift
//  Mocking
//
//  Created by Benjamin Hall on 17/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import Foundation

class Buyer {
    func view(_ house: HouseProtocol) {
        house.conductViewing()
    }
}

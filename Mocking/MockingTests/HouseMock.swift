//
//  HouseMock.swift
//  MockingTests
//
//  Created by Benjamin Hall on 17/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import Foundation
@testable import Mocking

class HouseMock: HouseProtocol {
    var numberOfViewings = 0
    
    func conductViewing() {
        numberOfViewings += 1
    }
}

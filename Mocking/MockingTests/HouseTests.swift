//
//  HouseTests.swift
//  MockingTests
//
//  Created by Benjamin Hall on 17/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import XCTest
@testable import Mocking

class HouseTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewingHouseAddsOneToViewings() {
        let house = House()
        let initialViewings = house.numberOfViewings
        
        house.conductViewing()
        
        XCTAssertEqual(house.numberOfViewings, initialViewings + 1)
    }

}

//
//  BuyerTests.swift
//  MockingTests
//
//  Created by Benjamin Hall on 17/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import XCTest
@testable import Mocking

class BuyerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBuyerViewingHouseAddsOneToViewings() {
        let house = HouseMock()
        let buyer = Buyer()
        let viewingsBeforeView = house.numberOfViewings
        
        buyer.view(house)
        
        XCTAssertEqual(house.numberOfViewings, viewingsBeforeView + 1)
    }
    

}

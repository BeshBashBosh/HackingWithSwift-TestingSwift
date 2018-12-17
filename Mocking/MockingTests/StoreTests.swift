//
//  StoreTests.swift
//  MockingTests
//
//  Created by Benjamin Hall on 17/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import XCTest
@testable import Mocking

class StoreTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStoreBuyingWithoutUser() {
        let store = StoreMock()
        
        _ = store.buy(product: "War of the Worlds")
        
        XCTAssertTrue(store.wasAssertionSuccessful)
    }
}

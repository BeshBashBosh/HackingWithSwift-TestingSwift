//
//  SecondTests.swift
//  SecondTests
//
//  Created by beshbashbosh on 13/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import XCTest
@testable import Second

class SecondTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test4Bed2BathHouse_Fits3Bed2BathRequirements() {
        let house = House(bedrooms: 4, bathrooms: 2)
        let desiredBedrooms = 3
        let desiredBathrooms = 2
        
        let suitability = house.checkSuitability(desiredBedrooms: desiredBedrooms,
                                            desiredBathrooms: desiredBathrooms)
        XCTAssertTrue(suitability)
    }

}

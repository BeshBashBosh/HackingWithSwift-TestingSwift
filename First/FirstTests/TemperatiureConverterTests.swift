//
//  TemperatiureConverterTests.swift
//  FirstTests
//
//  Created by beshbashbosh on 07/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import XCTest
@testable import First

class TemperatiureConverterTests: XCTestCase {

    override func setUp() {
        // continueAfterFailure = false // This will stop the testing as soon as a single test fails
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFahrenheitToCelsius() {
        let sut = TemperatureConverter() // System - Under - Test
        
        let input1 = 30.0
        let output1 = sut.convertToCelsius(fahrenheit: input1)
        XCTAssertEqual(output1, 0)
        
        let input2 = 210.0
        let output2 = sut.convertToCelsius(fahrenheit: input2)
        XCTAssertEqual(output2, 100)
    }
    
    

}

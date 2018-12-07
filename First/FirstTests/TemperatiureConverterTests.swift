//
//  TemperatiureConverterTests.swift
//  FirstTests
//
//  Created by beshbashbosh on 07/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import XCTest
@testable import First

class TemperatureConverterTests: XCTestCase {

    var sut: TemperatureConverter!
    
    override func setUp() {
        sut = TemperatureConverter()
        
        // This will stop the testing as soon as a single test fails
        // Typically used in UI tests
        // continueAfterFailure = false
    }

    override func tearDown() {
        sut = nil
    }

//    func testFahrenheitToCelsius() {
//        let sut = TemperatureConverter() // System - Under - Test
//
//        let input1 = 32.0
//        let output1 = sut.convertToCelsius(fahrenheit: input1)
//        XCTAssertEqual(output1, 0)
//
//        let input2 = 212.0
//        let output2 = sut.convertToCelsius(fahrenheit: input2)
//        XCTAssertEqual(output2, 100)
//    }
    
    func test32FahrenheitIsZeroCelsius() {
        let input = 32.0 // Arrange
        
        let output = sut.convertToCelsius(fahrenheit: input) // Act
        
        XCTAssertEqual(output, 0.0, accuracy: 0.000001, " celsius") // Assert
    }
    
    func test212FahrenheitIs100Celsius() {
        let input = 212.0
        
        let output = sut.convertToCelsius(fahrenheit: input)
        
        XCTAssertEqual(output, 100, accuracy: 0.000001, " celsius")
    }
    
    func test100FahrenheitIs37Celsius() {
        let input = 100.0
        
        let celsius = sut.convertToCelsius(fahrenheit: input)
        
        XCTAssertEqual(celsius, 37.777777, accuracy: 0.000001, " celsius")
    }
    
    

}

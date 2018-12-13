//
//  AsyncTests.swift
//  AsyncTests
//
//  Created by beshbashbosh on 13/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import XCTest
@testable import First

class AsyncTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
    }
    
    func testPrimesUpTo100ShouldBe0() {
        // Arrange
        let maxCount = 100
        let expectation = XCTestExpectation(description: "Calculates primes up to \(maxCount)")
        // Act
        AsyncPrimeCalculator.calculate(upTo: maxCount) {
            // Assert
            XCTAssertEqual($0.count, 25)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }

}

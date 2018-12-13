//
//  NotificationTests.swift
//  NotificationTests
//
//  Created by beshbashbosh on 13/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import XCTest
@testable import First

class NotificationTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testUserUpgradedPostNotification() {
        // Arrange
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradedNotification)
        
        // Act
        user.upgrade()
        
        // Assert
        wait(for: [expectation], timeout: 3)
    }
    
    func testUserUpgradedToGoldPostNotification() {
        // Arrange
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradedNotificationWithInfo)
        expectation.handler = { notification -> Bool in
            guard let level = notification.userInfo?["level", default: "Free"] as? String else { return false }
            return level.lowercased() == "gold" ? true : false
        }
        
        // Act
        user.upgradeWithInfo()
        
        // Assert
        wait(for: [expectation], timeout: 3)
        
    }

}

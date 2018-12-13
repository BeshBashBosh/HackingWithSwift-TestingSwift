//
//  GameTests.swift
//  FirstTests
//
//  Created by Benjamin Hall on 11/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import XCTest
@testable import First



class GameTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func initialiseGameWith(name: String) -> Game {
        return Game(name: name)
    }

    func testGameInitialisedWithNameBioBlitz() {
        // Arrange
        let name = "BioBlitz"
        let game: Game = Game(name: name)
        // Act
        let gameName = game.name
        // Assert
        XCTAssertEqual(gameName, name, "Game did not initialise with \(name) correctly")
    }
    
    func testGameInitialisedWithNameBlastazap() {
        // Arrange
        let name = "Blastazap"
        let game: Game = Game(name: name)
        // Act
        let gameName = game.name
        // Assert
        XCTAssertEqual(gameName, name, "Game did not initialise with \(name) correctly")
    }
    
    func testGameInitialisedWithNameDeadStormRising() {
        // Arrange
        let name = "Dead Storm Rising"
        let game: Game = Game(name: name)
        // Act
        let gameName = game.name
        // Assert
        XCTAssertEqual(gameName, name, "Game did not initialise with \(name) correctly")
    }
    
    func testPlayingBioBlitzThrows() {
        let game = Game(name: "BioBlitz")
        
        do {
            try game.play()
            XCTFail()
        } catch GameError.notPurchased {
           // Bonza!
        } catch {
            XCTFail("BioBLitz has not been purchased")
        }
    }
    
    func testPlayingBlastazapThrows() {
        let game = Game(name: "Blastazap")
        XCTAssertThrowsError(try game.play()) { error in
            XCTAssertEqual(error as? GameError, GameError.notInstalled, "Blastazap should not be installed")
        }
    }
    
    func testPlayingExplodingMonkeysDoesNotThrow() {
        let game = Game(name: "Exploding Monkeys")
        XCTAssertNoThrow(try game.play())
    }
    
//    func testDeadStormRisingThrows() throws {
//        let game = Game(name: "Dead Storm Rising")
//        try game.play()
//    }
    
    func testCrashyPlaneDoesntThrows() throws {
        let game = Game(name: "Crashy Plane")
        try game.play()
    }

}




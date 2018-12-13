//
//  ViewControllerTests.swift
//  FirstTests
//
//  Created by beshbashbosh on 13/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import XCTest
@testable import First

class ViewControllerTests: XCTestCase {

//    var sut: ViewController!
    
    override func setUp() {
//        sut = ViewController()
//        sut.loadViewIfNeeded()
//        sut.viewDidLoad()
    }

    override func tearDown() {
       // sut = nil
    }

    func testViewControllerButtonStroyBoardLinkExists() {
        let sut = ViewController()
        sut.loadViewIfNeeded()
        sut.viewWillAppear(false)
        XCTAssertNotNil(sut.button, "Button not linked up or initialised correctly in ViewController")
    }
    
//    func testViewControllerLabelStroyBoardLinkExists() {
//        XCTAssertNotNil(sut.label, "Label not linked up or initialised correctly in ViewController")
//    }
    
//    func testCanMutateViewControllerButtonTitle() {
//        sut.viewWillAppear(false)
//
//        let mutatingTitle = "NewTitle"
//
//        sut.button.setTitle(mutatingTitle, for: .normal)
//        let mutatedTitle = sut.button.titleLabel!.text!
//
//        XCTAssertEqual(mutatingTitle, mutatedTitle, "Button Title not mutated: Tried to set to \(mutatingTitle), currently set to \(mutatedTitle)")
//    }
//
//    func testCanMutateViewControllerLabelText() {
//        let mutatingText = "NewText"
//
//        sut.label.text = mutatingText
//        let mutatedText = sut.label.text!
//
//        XCTAssertEqual(mutatingText, mutatedText, "Label Text not mutated: Tried to set to \(mutatingText), currently set to \(mutatedText)")
//    }

}

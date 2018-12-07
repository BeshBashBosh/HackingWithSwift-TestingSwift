//
//  LifecycleTests.swift
//  FirstTests
//
//  Created by beshbashbosh on 07/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import XCTest
@testable import First

class LifecycleTests: XCTestCase {

    override class func setUp() {
        print("In class setUp")
    }
    
    override class func tearDown() {
        print("In class tearDown")
    }
    
    override func setUp() {
        print("In setUp")
    }

    override func tearDown() {
        print("In tearDown")
    }
    
    func testDemonstrateTestingLifecyle() {
        print("Starting test.")
        
        addTeardownBlock {
            // Examples of stuff to teardown could include:
            //  Close a file that needed to be opened for the test
            //  Delete some data that was written during the test
            print("In FIRST addTearDown block")
        }
        
        print("Reached middle of test")
        
        addTeardownBlock {
            print("In SECOND addTeardown block")
        }
        
        print("Reached end of test. Finishing up...")
    }
    
    func testSecondTest() {
        print("Began Second test")
        print("Completed Second test")
    }

    

}

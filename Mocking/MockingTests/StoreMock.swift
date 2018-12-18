
//
//  StoreMock.swift
//  MockingTests
//
//  Created by Benjamin Hall on 17/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import Foundation
@testable import Mocking

class StoreMock: Store {
    var wasAssertionSuccessful = false

    override func assert(_ condition: @autoclosure () -> Bool,
                        _ message: @autoclosure () -> String = String(),
                        file: StaticString = #file, line: UInt = #line) {
        wasAssertionSuccessful = condition()
    }
    
}

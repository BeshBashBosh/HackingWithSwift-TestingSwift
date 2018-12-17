//
//  Store.swift
//  Mocking
//
//  Created by Benjamin Hall on 17/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import Foundation

class Store {
    var user: User?
    
    func buy(product: String) -> Bool {
        assert(user != nil, "We can't buy anything without a user.")
        
        print("The user bought \(product).")
        return true
    }
    
    func assert(_ condition: @autoclosure () -> Bool,
                      _ message: @autoclosure () -> String = String(),
                      file: StaticString = #file, line: UInt = #line) {
        Swift.assert(condition, message, file: file, line: line)
    }
}

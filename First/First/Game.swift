//
//  Game.swift
//  First
//
//  Created by Benjamin Hall on 11/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import Foundation

enum GameError: LocalizedError {
    case notPurchased
    case notInstalled
    case parentalControlsDisallowed
}

extension LocalizedError {
    var errorDescription: String? {
        return "\(self)"
    }
}

struct Game {
    let name: String
    
    func play() throws {
        if name == "BioBlitz" {
            throw GameError.notPurchased
        } else if name == "Blastazap" {
            throw GameError.notInstalled
        } else if name == "Dead Storm Rising" {
            throw GameError.parentalControlsDisallowed
        } else {
            print("\(name) is OK to play")
        }
    }
}

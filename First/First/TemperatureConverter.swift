//
//  TemperatureConverter.swift
//  First
//
//  Created by beshbashbosh on 07/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import Foundation

struct TemperatureConverter {
    func convertToCelsius(fahrenheit: Double) -> Double {
        return (fahrenheit - 32) * 5 / 9
    }
}

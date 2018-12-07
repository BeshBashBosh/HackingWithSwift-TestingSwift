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
        let fahrenheit = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
        let celsius = fahrenheit.converted(to: .celsius)
        return celsius.value
    }
    
//    func convertToCelsius(fahrenheit: Double) -> Double {
//        return (fahrenheit - 32) * 5 / 9
//    }
}

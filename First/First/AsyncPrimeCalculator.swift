//
//  AsyncPrimeCalculator.swift
//  First
//
//  Created by beshbashbosh on 13/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import Foundation

struct AsyncPrimeCalculator {
    static func calculate(upTo max: Int, completion: @escaping ([Int]) -> Void) {
        // Do on bg queue
        DispatchQueue.global().async {
            guard max > 1 else {
                // return immediately if max is 0 or 1 as they are not primes by definition
                return
            }
            
            // Start out with all numbers being a prime
            var sieve = Array(repeating: true, count: max)
            // Mark 0 and 1 as not primes
            sieve[0] = false
            sieve[1] = false
            // Loop from 2 to max determining multiples and hence primes
            for number in 2 ..< max {
                // if a prime, every multiple of it in range is prime
                if sieve[number] == true {
                    for multiple in stride(from: number * number, to: sieve.count, by: number) {
                       sieve[multiple] = false
                    }
                }
            }
            
            // Collapse results to single array (e.g. map boolean trues to actual values of primes)
            let primes = sieve.enumerated().compactMap { $1 == true ? $0 : nil }
            completion(primes)
        }
    }
    
    static func calculateWithProgress(upTo max: Int, completion: @escaping ([Int]) -> Void) -> Progress {
        // Craete progress object to track completion up to max no
        let progress = Progress(totalUnitCount: Int64(max))
        
        DispatchQueue.global().async {
            guard max > 1 else { return }
            var sieve = Array(repeating: true, count: max)
            sieve[0] = false
            sieve[1] = false
            
            // Add 2 (for manual checks against 0 and 1 as prime) to progress counter
            progress.completedUnitCount += 2
            
            for number in 2 ..< max {
                // Everytime number is checked, add to progress unit count
                progress.completedUnitCount += 1
                // if a prime, every multiple of it in range is prime
                if sieve[number] == true {
                    for multiple in stride(from: number * number, to: sieve.count, by: number) {
                        sieve[multiple] = false
                    }
                }
            }
            
            // Collapse results to single array (e.g. map boolean trues to actual values of primes)
            let primes = sieve.enumerated().compactMap { $1 == true ? $0 : nil }
            completion(primes)
        }
        
        return progress
    }
}

//
//  FizzBuzz.swift
//  testingAdvLecture
//
//  Created by Joe Burgess on 7/27/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

import UIKit

class FizzBuzz: NSObject {
// loop. if counter evenly divisible by 5, print fizz, divisible by 3, print buzz, divisible by 3 and 5 print fizzbuzz

    class func run(beginning: UInt, end: UInt) -> String {
        var result = ""
        var correctedBeginning = beginning
        var correctEnding = end
        if end < beginning {
            correctedBeginning = end
            correctEnding = beginning
        }
        for i in correctedBeginning...correctEnding {
            result.appendContentsOf(self.correctMessage(i))
        }
        return result
    }

    class func correctMessage(number: UInt) -> String {
        if number % 3 == 0 && number % 5 == 0 {
            return "FizzBuzz"
        } else if number % 3 == 0 {
            return "Buzz"
        } else if number % 5 == 0  {
            return "Fizz"
        }

        return ""

    }
}

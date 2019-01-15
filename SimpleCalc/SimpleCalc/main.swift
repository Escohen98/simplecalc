//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    //Checks for basic calculator arguments. If yes, returns a double of the calculated value. Otherwise moves to special case.
    //Program assumes arguments passed are numeric characters.
    public func calculate(_ args: [String]) -> Double {
        switch args[1] {
            case "+": return Double(args[0])! + Double(args[1])!
            case "-": return Double(args[0])! - Double(args[1])!
            case "/": return Double(args[0])! / Double(args[1])!
            case "%": return Double(Int(args[0])! % Int(args[1])!)
            case "*": return Double(args[0])! * Double(args[1])!
            default: return specialCalculate(args)
        }
    }
    
    /*
    * Function assumes all values in array argv other than the last value
    * are numeric characters.
    * Handles Special Cases
    * Case count - Returns the count of all number arguments
    * Case avg - Returns the average of all the numbers
    * Case fact - Returns the factorial of the number in the first index of the given array.
    * Case default - Returns -1. Should never occur.
    */
    public func specialCalculate(_ argv: [String]) -> Double {
        let nums = argv.count-2
        switch argv[argv.count-1] {
            case "count": return Double(nums)
            case "avg":
                var sum : Double = 0
                for index in 0...nums {
                    sum = sum + Double(argv[index])!
                }
                var newArgv = argv
                newArgv[argv.count-1] = "count"
                return sum/specialCalculate(newArgv)
            case "fact":
                var factorial = 1
                for i in Int(argv[0])!...1 {
                    if i != 0 {
                        factorial = factorial * i
                    }
                }
                return Double(factorial)
            default: return -1;
        }
    }
    
    public func calculate(_ arg: String) -> Double {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))


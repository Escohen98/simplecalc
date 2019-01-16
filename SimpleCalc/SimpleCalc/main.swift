//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    /*Checks for basic calculator arguments. If yes, returns a double of the calculated
    * value. Otherwise moves to special case.
    * @param args - String array of numbers and a desired operation.
    *Program assumes arguments passed are numeric characters.
    * If expected numeric values are not, converts to 0.
    */
    public func calculate(_ args: [String]) -> Int {
        if(args.count <= 1) {
            return 0;
        }
        let zero = Double(args[0]) ?? 0
        let two: Double;
        if(args.count == 3) {
            two = Double(args[2]) ?? 0
        } else {
            two = 0
        }
        switch args[1] {
            case "+": return Int(zero + two)
            case "-": return Int(zero - two)
            case "/": return Int(zero / two)
            case "%": return Int(zero) % Int(two)
            case "*": return Int(zero * two)
            default: return specialCalculate(args)
        }
    }
    
    /*
    * Function assumes all values in array argv other than the last value
    * as numeric characters. If not, treats value as 0.
    * Handles Special Cases
    * @param argv - String array of numbers and a desired operation.
    * Case count - Returns the count of all number arguments
    * Case avg - Returns the average of all the numbers
    * Case fact - Returns the factorial of the number in the first index of the given array.
    * Case default - Returns 0. Should never occur.
    */
    public func specialCalculate(_ argv: [String]) -> Int {
        let nums = argv.count-1
        switch argv[nums] {
            case "count": return nums
            case "avg":
                var sum : Double = 0
                for index in 0...nums {
                    sum = sum + (Double(argv[index]) ?? 0)
                }
                var newArgv = argv
                newArgv[nums] = "count"
                let count = Double(specialCalculate(newArgv))
                if count == 0.0 {
                    return 0;
                }
                return Int(sum/count)
            case "fact":
                var factorial = 1
                for i in 1...(Int(argv[0]) ?? 1) {
                    if i != 0 {
                        factorial = factorial * i
                    }
                }
                return factorial
            default:
                print("Please enter either a math operation or a special case, count, fact, or avg.")
                return 0;
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))


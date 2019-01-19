//
//  Closures.swift
//  Closures
//
//  Created by Saleh Enam Shohag on 19/1/19.
//  Copyright © 2019 Nazia Afroz. All rights reserved.
//

import UIKit

//this is writted according to swift 4.2
//code ref is swift officila documentation
//Global functions are closures that have a name and do not capture any values.

//Global function

func iamGlobalFunction(){
    print("I am global function i can be called from anywhere")
}

func iamNestedWithinGlobal(){
    print("iamNestedWithinGlobal")
    
    //Nested functions are hidden from outside world by default
    //but still can be called and used by their enclosing function
    func iamNestedFunc(){
        print("i am NestedFunction")
    }
    iamNestedFunc()
}


//Closures are self-contained blocks of functionality that can be passed around and used in your code.
//Swift’s closure expressions have a clean, clear style, with optimizations
//These optimizations include:
/*
 Inferring parameter and return value types from context
 Implicit returns from single-expression closures
 Shorthand argument names
 Trailing closure syntax
 */

class Closures: NSObject {
    
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    
    //MARK:- starting code
    func runClosure() -> Void {
        //1.
        let reversedNames = names.sorted(by: self.backward)
        print("\(reversedNames)")
        
        let inOrderNames = names.sorted(by: self.inWard)
        print("\(inOrderNames)")
        
        self.closureExpresionSyntax1()
        self.closureExpressionInferTypes()
        self.implicitReturnFromSingleExpressionClosure()
        self.shortHandArgumentNames()
        self.operatorMethods()
        self.arrayOfStringValues()
        self.convertStringToDigit()
        self.makeIncrementerInAction()
        self.closuresAreRefTypes()
        self.testDoSomeThing()
    }

    //Closure expressions provide several syntax optimizations
    //First write the normal function
    func backward(_ s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
    func inWard(_ s1: String, _ s2: String) -> Bool {
        return s1 < s2
    }
    
    //Closure expresion syntax 1
    /*
     { (parameters) -> return type in
        statements
     }
     
     */
    func closureExpresionSyntax1(){
        print("closureExpresionSyntax1()")
        let reverseNames = names.sorted(by: {(_ s1: String, _ s2: String) -> Bool in
            return s1 > s2
        })
        print("\(reverseNames)")
    }
    
    
    //MARK:- Inferring Type From Context
    func closureExpressionInferTypes(){
        print("closureExpressionInferTypes()")
        let reverseNames = names.sorted(by: {s1, s2 in return s1 > s2})
        print("\(reverseNames)")
    }
    
    
    
    //Implicit Returns from Single-Expression Closures
    func implicitReturnFromSingleExpressionClosure(){
        print("implicitReturnFromSingleExpressionClosure()")
        
        let reverseNames = names.sorted(by: {s1, s2 in s1 > s2})
        print("\(reverseNames)")
        
    }
    
    
    //Shorthand Argument Names
    func shortHandArgumentNames(){
        print("shortHandArgumentNames()")
        let reverseNames = names.sorted(by: {$0 > $1})
        print("\(reverseNames)")
    }
    
    
    
    //Operator Methods
    func operatorMethods(){
        print("\(operatorMethods)")
        let reverseNames = names.sorted(by: >)
        print("\(reverseNames)")
    }
    
    //Trailing Closure
    //Mark:- Trailing Closure
    /*
     *A trailing closure is written after the function call’s parentheses,
     * even though it is still an argument to the function.
     */
    
    func someFunctionThatTakesAClosure(closure: () -> Void){
        //Function Bodies goes here
    }
    func callToSomeFunctionThatTakesAClosure(){
        someFunctionThatTakesAClosure(closure: {
            // Closures body goes here
            print("calling closure function")
        })
    }
    func callToSomeFunctionWithTrailingSyntax(){
        someFunctionThatTakesAClosure {
            //Trailing Closure body goes here
            
        }
    }
    
    func stringSortingWithTrailingClosure(){
        let reversedNames = names.sorted(){return $0 > $1}
        print("\(reversedNames)")
    }
    //Trailing Example
    let digitNames = [
        0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
        5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
    ]
    let numbers = [16, 58, 510]
    
    let namesDigit = ["One": 1, "Two": 2, "Three": 3]
    let values = ["One", "Two", "Three"]
    
//    let strings =
    func arrayOfStringValues() -> Void {
        print("arrayOfStringValues()")
        let strings = numbers.map { (number) -> String in
            
            var number = number
            var output = ""
            repeat {
                output = digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            return output
        }
        print("\(strings)")
    }
    
    func convertStringToDigit() -> Void {
        print("convertStringToDigit()")
        let digits = values.map() { (value) -> Int in
            return namesDigit[value] ?? 0
        }
        print("\(digits)")
    }
    
    
    //MARK:- Capturing Values
    //In Swift, the simplest form of a closure that can capture values is a nested function,
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func increment() -> Int {
            print("nested -- increment()")
            runningTotal += amount
            return runningTotal
        }
        return increment
    }
    
    func makeIncrementerInAction(){
        let incrementByTen = makeIncrementer(forIncrement: 10)
        print("\(incrementByTen())")
        print("\(incrementByTen())")
        print("\(incrementByTen())")
        print("\(incrementByTen())")
        
        let incrementBySeven = makeIncrementer(forIncrement: 7)
        print("\(incrementBySeven())")
        
        print("\(incrementByTen())")
    }
    
    //MARK:- Closures Are Reference Types
    func closuresAreRefTypes(){
        print("closuresAreRefTypes()")
        let incrementByTen = makeIncrementer(forIncrement: 10)
        print("\(incrementByTen())")
        print("\(incrementByTen())")
        print("\(incrementByTen())")
        
        let alsoIncrementByTen = incrementByTen
        print("\(alsoIncrementByTen())")
    }
    
    
    //MARK:- Escaping Closures
    var completionHandlers: [() -> Void] = []
    
    func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void){
        completionHandlers.append(completionHandler)
    }
    func someFunctionWithNonEscapingClosure(closure: () -> Void){
        closure()
    }
    
    
    var x = 10
    func doSomeThing(){
        someFunctionWithEscapingClosure {() -> Void in
            self.x = 100
        }
        someFunctionWithNonEscapingClosure { () -> Void in
            
            x = 10
            
        }
    }
    
    func testDoSomeThing(){
        print("\n testDoSomeThing()")
        doSomeThing()
        print("\(self.x)")
        completionHandlers.first?()
        print("\(self.x)")
    }
 
    var testOptional: Int?
    
    func takesClosure(function: (Int, Int) -> Int, anotherParam: Int){
        print("takesClosure")
        let result = function(10, 20)
        print("\(result)")
    }
    
}

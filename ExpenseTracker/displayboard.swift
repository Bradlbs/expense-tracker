//
//  displayboard.swift
//  ExpenseTracker
//
//  Created by 吃面包的布拉德 on 2017/8/6.
//  Copyright © 2017年 吃面包的布拉德. All rights reserved.
//

import Foundation

public func delete (_ number : Double) -> Double{
    /*var newnumber : Double
     if number >= 10.0{
     let numberstring = String(number)
     let newnumberstring : String
     if !numberstring.contains(".") || !lastdigitisdot(number){
     let stringindex : String.Index = numberstring.index(before: numberstring.endIndex)
     newnumberstring = numberstring.substring(to: stringindex)
     }
     else{
     let stringindex : String.Index = numberstring.index(before: numberstring.endIndex)
     let newstringindex = numberstring.index(before: stringindex)
     newnumberstring = numberstring.substring(to: newstringindex)
     }
     newnumber = Double(newnumberstring)!
     }
     else{
     newnumber = 0
     }
     return newnumber*/
    return 0
}

public func dot (number : Double)  -> Double{
    var newnumber : Double
    let numberstring = String(number)
    if numberstring.contains("."){
        return number
    }
    else{
        let newnumberstring = numberstring + ".0"
        newnumber = Double(newnumberstring)!
        return newnumber
    }
}

public func lastdigitisdot(_ number : Double) -> Bool{
    let numberstring = String (number)
    if numberstring.contains("."){
        let newnumberstring = numberstring.substring(to: numberstring.endIndex)
        if newnumberstring.substring(to: newnumberstring.endIndex).contains("."){
            return true
        }
        else{
            return false
        }
    }
    else{
        return false
    }
}

struct displayboard {
    private var accumulator : Double?
    
    private var operations : Dictionary <String,Operation> = [
        "." : Operation.unaryOperation(dot),
        "C" : Operation.unaryOperation(delete),
        "+" : Operation.binaryOperation({$0 + $1}),
        "-" : Operation.binaryOperation({$0 - $1}),
        "=" : Operation.equls
    ]
    
    private enum Operation{
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equls
    }
    
    mutating func performOperation(_ symbol: String){
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil{
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil{
                    pbo = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equls:
                performPendingBinaryOperation()
            }
        }
    }
    
    private mutating func performPendingBinaryOperation(){
        if pbo != nil && accumulator != nil{
            accumulator! = pbo!.perform(with: accumulator!)
            pbo = nil
        }
    }
    
    private struct PendingBinaryOperation {
        let function: (Double,Double) -> Double
        let firstOperand : Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand,secondOperand)
        }
    }
    
    private var pbo : PendingBinaryOperation?
    
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double?{
        get{
            return accumulator
        }
    }
    
}

//
//  Userdata.swift
//  ExpenseTracker
//
//  Created by bradlbs on 2017/9/28.
//  Copyright © 2017年 吃面包的布拉德. All rights reserved.
//

import Foundation

struct Userdata {
    static var income : [String : Array<Expense>] = [:]
    static var outcome : [String : Array<Expense>] = [:]
    static var totalincome : [String : Double] {
        get{
            return gettotal(array1: income)
        }
    }
    static var totaloutcome : [String : Double] = [:]
}

func gettotal(array1 : [String : Array<Expense>]) -> [String : Double]{
    var total : [String : Double] = [:]
    for date : String in array1.keys {
        var totalcost : Double = 0
        let expenseArray = array1[date]
        var costArray : [Double] = []
        for expense in expenseArray! {
            costArray.append(expense.amount)
        }
        for cost in costArray {
            totalcost += cost
        }
        total[date] = totalcost
    }
    return total
}

class Expense{
    var amount : Double
    var category : String
    
    init(data : [String :Any]) {
        if let amount = data["amount"] as? Double{
            self.amount = amount
        }
        else{
            self.amount = 0.00
        }
        
        if let category = data["category"] as? String{
            self.category = category
        }
        else{
            self.category = ""
        }
    }
    
    init(amount : Double, category : String) {
        self.amount = amount
        self.category = category
    }
}

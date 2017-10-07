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

func getmonth(date : Date) -> String {
    let calender = Calendar.current
    let month = calender.component(.month, from: date)
    return String(month)
}

class Expense{
    var amount : Double
    var category : String
    var isincome : Bool
    var date : Date
    var monthly : MonthlyExpense
    
    
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
        if let isincome = data["income"] as? Bool{
            self.isincome = isincome
        }
        else{
            isincome = false
        }
        if let date = data["date"] as? Date{
            self.date = date
        }
        else{
            self.date = Date()
        }
        if let monthly = data["monthly"] as? MonthlyExpense{
            self.monthly = monthly
        }
        else{
            self.monthly = MonthlyExpense(totalincome: 0, totaloutcome: 0, month: "")
        }
    }
    
    init(amount : Double, category : String, isincome : Bool, date: Date, monthly : MonthlyExpense) {
        self.amount = amount
        self.category = category
        self.isincome = isincome
        self.date = date
        self.monthly = monthly
    }
}

class MonthlyExpense{
    var totalincome : Double
    var totaloutcome : Double
    var month : String
    
    init(totalincome : Double, totaloutcome : Double, month : String) {
        self.totalincome = totalincome
        self.totaloutcome = totaloutcome
        self.month = month
    }
}

struct Monthamount {
    static var monthdescription : [String : MonthlyExpense]  = [:]
    static let months : [String] = ["01","02","03","04","05","06","07","08","09","10","11","12"]
    static func initdata(){
        for month in months {
            monthdescription[month] = MonthlyExpense(totalincome: 0, totaloutcome:0, month: month)
        }
    }
}








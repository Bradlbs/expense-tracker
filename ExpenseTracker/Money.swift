//
//  Money.swift
//  ExpenseTracker
//
//  Created by bradlbs on 2017/10/6.
//  Copyright © 2017年 吃面包的布拉德. All rights reserved.
//

import UIKit
import CoreData

class Money: NSManagedObject {
    class func addmoney(matching expense : Expense, in context : NSManagedObjectContext)  -> Money{
        let money : Money = NSEntityDescription.insertNewObject(forEntityName: "Money", into: context) as! Money
        money.amount = expense.amount
        money.category = expense.category
        money.date = expense.date as NSDate
        money.isincome = expense.isincome
        money.monthly = try? Monthly.findorcreatmonth(matching: expense.monthly, in: context)
        
        return money
    }
    
}

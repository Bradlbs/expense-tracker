//
//  Monthly.swift
//  ExpenseTracker
//
//  Created by bradlbs on 2017/10/6.
//  Copyright © 2017年 吃面包的布拉德. All rights reserved.
//

import UIKit
import CoreData

class Monthly: NSManagedObject {
    class func findorcreatmonth(matching monthlyexpense : MonthlyExpense, in context : NSManagedObjectContext) throws -> Monthly{
        let request: NSFetchRequest<Monthly> = Monthly.fetchRequest()
        request.predicate = NSPredicate(format: "handle = %@", monthlyexpense.month)
        do {
            let matches = try context.fetch(request)
            if matches.count > 0 {
                assert(matches.count == 1, "Monthly.findorcreatmonth -- database inconsistency!")
                return matches[0]
            }
        } catch {
            throw error
        }
        
        let monthly : Monthly = Monthly(context: context)
        monthly.month = monthlyexpense.month
        monthly.totalincome = monthlyexpense.totalincome
        monthly.totaloutcome = monthlyexpense.totaloutcome
        return monthly
    }

}

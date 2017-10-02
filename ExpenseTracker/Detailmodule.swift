//
//  Detailmodule.swift
//  ExpenseTracker
//
//  Created by 吃面包的布拉德 on 2017/8/27.
//  Copyright © 2017年 吃面包的布拉德. All rights reserved.
//

import Foundation

public func getdate(_ date : Date) -> String
{
    //let currentdate = Date()
    let dateformat = DateFormatter()
    dateformat.dateStyle = .long
    let datestring = dateformat.string(from: date)
    return datestring
}

struct showoption {
    static var showingoption = ""
}

//
//  ChartViewController.swift
//  ExpenseTracker
//
//  Created by 吃面包的布拉德 on 2017/7/30.
//  Copyright © 2017年 吃面包的布拉德. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var chartview: LineChartView!
    
    var monthlycost = [500,450,600,800,2000,1000,800,400,500,1200,1500,780]

    override func viewDidLoad() {
        super.viewDidLoad()
        drawchart()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawchart(){
        var lineChartEntry  = [ChartDataEntry]()
        
        for i in 0..<monthlycost.count{
            let value = ChartDataEntry(x: Double(i), y: Double(monthlycost[i]))
            lineChartEntry.append(value)
        }
        
        let line1 = LineChartDataSet(values: lineChartEntry, label: "Cost")
        
        line1.colors = [NSUIColor.blue]
        let data = LineChartData()
        data.addDataSet(line1)
        
        chartview.data = data
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectoptionpopover"{
            segue.destination.popoverPresentationController?.sourceRect = (sender as! UIView).bounds
            segue.destination.popoverPresentationController?.delegate = self
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    

}

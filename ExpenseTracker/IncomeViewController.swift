//
//  IncomeViewController.swift
//  ExpenseTracker
//
//  Created by bradlbs on 2017/9/27.
//  Copyright © 2017年 吃面包的布拉德. All rights reserved.
//

import UIKit

class IncomeViewController: UIViewController,UIPopoverPresentationControllerDelegate {
    
    var isdisplay = false
    
    private var disboard = displayboard()
    
    var dotstatus = false
    
    var category = ""
    
    var displayValue: Double{
        get{
            let str = amountlabel.text!
            let index = str.index(str.startIndex, offsetBy: 1)
            let number = Double(str.substring(from: index))
            return number!
        }
        set{
            if dotstatus{
                let newtext = "$" + String(newValue)
                amountlabel.text = newtext.substring(to: newtext.index(before: newtext.endIndex))
                dotstatus = false
            }
            else{
                amountlabel.text = "$" + String(newValue)
            }
            if newValue == 0{
                amountlabel.text = "$0"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func digitalbuttonaction(_ sender: UIButton) {
        let number = sender.currentTitle!
        let labelcontent = amountlabel.text!
        if isdisplay {
            amountlabel.text = labelcontent + number
        }
        else{
            amountlabel.text = "$" +  number
            isdisplay = true
        }
    }
    
    @IBAction func operationalbutton(_ sender: UIButton) {
        if isdisplay {
            disboard.setOperand(displayValue)
            if (sender.currentTitle != "."){
                isdisplay = false
            }
            else{
                isdisplay = true
                dotstatus = true
            }
        }
        if let mathsymbol = sender.currentTitle {
            disboard.performOperation(mathsymbol)
        }
        if let result = disboard.result {
            displayValue = result
        }
    }
    
    @IBOutlet weak var amountlabel: UILabel!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popoversegue2"{
            segue.destination.popoverPresentationController?.sourceRect = (sender as! UIView).bounds
            segue.destination.popoverPresentationController?.delegate = self
        }
    }
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBOutlet weak var numberpadview: UIView!{
        didSet{
            numberpadview.addSubview(datepicker)
            datepicker.isHidden = true
            numberpadview.isHidden = true
        }
    }
    
    @IBAction func activity(_ sender: UIButton) {
        numberpadview.isHidden = false
    }
    
    @IBAction func doneaction(_ sender: UIButton) {
        let date = bottomdatepicker.date
        let amount = displayValue
        if amount != 0 {
            /*data["amount"] = amount
             data["category"] = category
             print(data["amount"])
             print(data["category"])
             //let cost = Expense(data: data!)
             //userdata.income?[date]?.append(cost)*/
            let income = Expense(amount: amount,category: category)
            var incomearray : [Expense] = Userdata.income[getdate(date)] ?? []
            incomearray.append(income)
            Userdata.income[getdate(date)] = incomearray
            performSegue(withIdentifier: "incomedonesegue", sender: self)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        amountboard.resignFirstResponder()
    }
    
    @IBOutlet weak var amountboard: UITextField!
    
    @IBOutlet weak var bottomdatepicker: UIDatePicker!
    
    @IBAction func cancel(_ sender: UIButton) {
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

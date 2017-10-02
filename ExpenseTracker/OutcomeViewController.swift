//
//  SecondViewController.swift
//  ExpenseTracker
//
//  Created by 吃面包的布拉德 on 2017/7/25.
//  Copyright © 2017年 吃面包的布拉德. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController , UIPopoverPresentationControllerDelegate {
    
    var keyboardstatus = false
    var dotstatus = false
    
    //private var userdata = Userdata()
    
    var data : [String : Any] = [:]
    
    var category : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(showoption.showingoption == "Income"){
            performSegue(withIdentifier: "gotoincome", sender: self)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func activities(_ sender: UIButton) {
        numberpadview.isHidden = false
        category = sender.restorationIdentifier!
        //activitybar.isEnabled = false
        //activitybar.accessibilityElementsHidden = true
        
    }
    
    @IBOutlet var secondview: UIView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        amountboard.resignFirstResponder()
    }
    
    func textFieldShouldReturn（textField：UITextField）() ->Bool{
        amountboard.resignFirstResponder()
        return true
    }
    
    @IBAction func ExpenseorIncome(_ sender: UIButton) {
        /*let selectmenu = UIView()
         let newexpensebutton = UIButton()
         let newincomebutton = UIButton()
         selectmenu.addSubview(newexpensebutton)
         selectmenu.addSubview(newincomebutton)*/
    }
    
    var datepicker = UIDatePicker()
    
    @IBOutlet weak var numberpadview: UIView!{
        didSet{
            numberpadview.addSubview(datepicker)
            datepicker.isHidden = true
            numberpadview.isHidden = true
        }
    }
    
    @IBOutlet weak var amountboard: UITextField!
    
    @IBOutlet weak var amountlabel: UILabel!
    
    
    var isdisplay = false
    
    @IBAction func digitalbutton(_ sender: UIButton) {
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
    
    private var disboard = displayboard()
    
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
    
    
    @IBAction func donebutton(_ sender: UIButton) {
        let date = bottomdatepicker.date
        let amount = displayValue
        if amount != 0 {
            /*data["amount"] = amount
            data["category"] = category
            print(data["amount"])
            print(data["category"])
            //let cost = Expense(data: data!)
            //userdata.income?[date]?.append(cost)*/
            let cost = Expense(amount: amount,category: category)
            var incomearray : [Expense] = Userdata.income[getdate(date)] ?? []
            incomearray.append(cost)
            Userdata.income[getdate(date)] = incomearray
            performSegue(withIdentifier: "donesegue", sender: self)
        }
    }
    
    
    @IBOutlet weak var bottomdatepicker: UIDatePicker!
    
    @IBOutlet weak var activitybar: UITabBarItem!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popoversegue"{
            segue.destination.popoverPresentationController?.sourceRect = (sender as! UIView).bounds
            segue.destination.popoverPresentationController?.delegate = self
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    
    
    
    
    
    
    
    
    
    
}


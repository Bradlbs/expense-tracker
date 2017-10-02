//
//  FirstViewController.swift
//  ExpenseTracker
//
//  Created by 吃面包的布拉德 on 2017/7/25.
//  Copyright © 2017年 吃面包的布拉德. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var date : Date{
        get{
            return selecteddate
        }
        set{
            datebutton.setTitle(getdate(newValue), for: .normal)
        }
    }
    
    var selecteddate : Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        date = Date()
    }
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var incomelabel: UILabel!{
        didSet{
            if let amount = Userdata.totalincome[getdate(date)]{
                
                incomelabel.text = String(amount)
            }
            else{
                
                incomelabel.text = "0.00"
            }
        }
    }
    
    @IBOutlet weak var outcomelabel: UILabel!
    
    @IBOutlet weak var datebutton: UIButton!{
        didSet{
            //print(date)
            datebutton.setTitle(getdate(date), for: .normal)
        }
    }
    
    @IBAction func chosedate(_ sender: UIButton) {
        newdatepicker.isHidden = false
    }
    
    
    @IBAction func setdatetobutton(_ sender: UIDatePicker) {
        //datepicker.addSubview(supportingdatepickerview)
        //datebutton.setTitle(getdate(sender.date), for: .normal)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        newdatepicker.isHidden = true
    }
    
    @IBAction func choosedate(_ sender: UIButton) {
        selecteddate = datepicker.date
        date = selecteddate
        if let amount = Userdata.totalincome[getdate(date)]{
            incomelabel.text = String(amount)
        }
        else{
            incomelabel.text = "0.00"
        }
        /*let dateformatter = DateFormatter()
         dateformatter.dateFormat = "yyyy年MM月dd日"
         let dateString = dateformatter.string(from: date)
         datebutton.setTitle(dateString, for: .normal)*/
        //print(newdate)
        //datebutton.setTitle(getdate(date), for: .normal)
        newdatepicker.isHidden = true
    }
    
    @IBOutlet weak var newdatepicker: UIStackView!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        newdatepicker.isHidden = true
    }
}


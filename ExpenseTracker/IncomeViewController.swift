//
//  IncomeViewController.swift
//  ExpenseTracker
//
//  Created by bradlbs on 2017/9/27.
//  Copyright © 2017年 吃面包的布拉德. All rights reserved.
//

import UIKit

class IncomeViewController: UIViewController,UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func digitalbuttonaction(_ sender: UIButton) {
        
    }
    

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

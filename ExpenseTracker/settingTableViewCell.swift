//
//  settingTableViewCell.swift
//  ExpenseTracker
//
//  Created by bradlbs on 2017/10/7.
//  Copyright © 2017年 吃面包的布拉德. All rights reserved.
//

import UIKit

class settingTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var settingswitch: UISwitch!
    @IBOutlet weak var settinglabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  BalanceTableViewCell.swift
//  1223
//
//  Created by Ivan Ermak on 4/1/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class BalanceTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var radioButton: UISwitch!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var demoLabel: UILabel!
    @IBOutlet weak var demoBalance: UILabel!
    @IBOutlet weak var tokenLabel: UILabel!
    @IBOutlet weak var tokenBalance: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

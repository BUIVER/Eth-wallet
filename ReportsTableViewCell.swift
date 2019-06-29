//
//  ReportsTableViewCell.swift
//  1223
//
//  Created by Ivan Ermak on 4/3/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class ReportsTableViewCell: UITableViewCell {
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var holdPeriod: UILabel!
    @IBOutlet weak var gainloss: UILabel!
    @IBOutlet weak var realizeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

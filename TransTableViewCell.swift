//
//  TransTableViewCell.swift
//  Eth wallet
//
//  Created by Ivan Ermak on 5/17/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class TransTableViewCell: UITableViewCell {
    @IBOutlet weak var classes: UILabel!
    
    @IBOutlet weak var amount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class FeeTableViewCell: UITableViewCell {
    @IBOutlet weak var gasFee: UILabel!
    
    @IBOutlet weak var sumAmount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

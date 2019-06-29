//
//  CellsTableViewCell.swift
//  Eth wallet
//
//  Created by Ivan Ermak on 5/17/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class CellsTableViewCell: UITableViewCell {
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

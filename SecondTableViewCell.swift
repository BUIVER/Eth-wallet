//
//  SecondTableViewCell.swift
//  1223
//
//  Created by Ivan Ermak on 4/3/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var sum: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var fromadd: UILabel!
    @IBOutlet weak var toadd: UILabel!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var classification: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

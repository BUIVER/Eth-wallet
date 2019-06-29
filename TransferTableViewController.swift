//
//  TransferTableViewController.swift
//  1223
//
//  Created by Ivan Ermak on 4/3/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class TransferTableViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    
    var selectedRowIndex = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
}
extension TransferTableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Second", for: indexPath) as? SecondTableViewCell{
            cell.date.text = String(describing: Date.init())
            cell.sum.text = String(Double(indexPath.row+2)/100)
            cell.sum.text?.append(" ETH")
            cell.fromadd.text = "0xA707EE695d894db6Cc1e5eE3750Eb5B242D3cAD9"
            cell.toadd.text = "0xA707EE695d894db6Cc1e5eE3750Eb5B242D3cAD9"
            cell.classification.text = "Payment for pizza"
            return cell }
        else {return UITableViewCell()}
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedRowIndex {
            return 300 //Expanded
        }
        return 88 //Not expanded
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedRowIndex == indexPath.row {
            selectedRowIndex = -1
        } else {
            selectedRowIndex = indexPath.row
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}

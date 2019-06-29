//
//  BalanceViewController.swift
//  1223
//
//  Created by Ivan Ermak on 4/1/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var newElement: UIView!
    
    var adressesSet: [String] = ["0xA707EE695d894db6Cc1e5eE3750Eb5B242D3cAD9", "0xA707EE695d894db6Cc1e5eE3750Eb5B242D3cAD9", "0xA707EE695d894db6Cc1e5eE3750Eb5B242D3cAD9", "0xA707EE695d894db6Cc1e5eE3750Eb5B242D3cAD9", "0xA707EE695d894db6Cc1e5eE3750Eb5B242D3cAD9", "0xA707EE695d894db6Cc1e5eE3750Eb5B242D3cAD9"]
    var balanceSet: [String] = ["0.13087 ETH", "0.17524 ETH", "0.00524 ETH", "0.00463 ETH", "0.00003 ETH", "0.01632 ETH"]
    @IBAction func addNewPressed(_ sender: Any) {
        newElement.isHidden = false
    }
    var selectedRowIndex = -1
    
    @IBAction func saveResults(_ sender: Any) {
        newElement.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        newElement.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension BalanceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adressesSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BalanceViewCell",
                                                    for: indexPath) as? BalanceTableViewCell {
            if (indexPath.row % 2 == 1) {
                
   
                
            }
            cell.addressLabel.text = adressesSet[indexPath.row]
            cell.nameLabel.text = String(indexPath.row)
            cell.balanceLabel.text = balanceSet[indexPath.row]
            return cell
        } else {return UITableViewCell()
        }
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

//
//  TableViewController.swift
//  1223
//
//  Created by Ivan Ermak on 4/3/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class ReportsTableViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate {
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var label6: UILabel!
    @IBOutlet var label7: UILabel!
    @IBOutlet var label8: UILabel!
    
    
    @IBAction func calculate(_ sender: Any) {
        table.isHidden = false
        label1.isHidden = false
        label3.isHidden = false
        label2.isHidden = false
        label4.isHidden = false
        label5.isHidden = false
        label6.isHidden = false
        label7.isHidden = false
        label8.isHidden = false
    }
    var selectedRowIndex = -1
    var array = ["0x76c3e9dbc1b0fd202ce9d9bb26d96028cf3789f6", "0x9a07fd8a116b7e3be9e6185861496af7a2041460", "0xae54c1380e27fa1b5977c71521a6169f7296af60",  "0xa0b73e1ff0b80914ab6fe0444e65848c4c34450b"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    var infoArray = ["Total realized Gain(Loss) ", "Total unrealized Gain(loss)", "Short term Gain(Loss)", "Long term Gain(Loss)"]
    var valueArray = ["0.06 $", "-0.14 $", "0.03 $", "-0.11 $"]
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ReportsTableViewCell",
                                                    for: indexPath) as? ReportsTableViewCell {
            cell.labelOne.text = String(describing: Date.init())
            cell.labelTwo.text = "ETH"
            cell.labelThree.text = String(Double(Int.random(in: 0...20)/100))
            cell.priceLabel.text = String(Int.random(in: 20...50))
            cell.priceLabel.text?.append("$")
            cell.holdPeriod.text = String(Int.random(in: 2...5)) + " days"
            cell.gainloss.text = cell.labelThree.text
            cell.realizeLabel.text = "realized"
            return cell
        } else {return UITableViewCell()}
        
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
    
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        table.isHidden = true
        picker.dataSource = self
        picker.delegate = self
        label1.text = infoArray[0]
        label2.text = infoArray[1]
        label3.text = infoArray[2]
        label4.text = infoArray[3]
        label5.text = valueArray[0]
        label6.text = valueArray[1]
        label7.text = valueArray[2]
        label8.text = valueArray[3]
        label1.isHidden = true
        label3.isHidden = true
        label2.isHidden = true
        label4.isHidden = true
        label5.isHidden = true
        label6.isHidden = true
        label7.isHidden = true
        label8.isHidden = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ReportsTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    
}

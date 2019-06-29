//
//  ValueTableViewController.swift
//  Eth wallet
//
//  Created by Ivan Ermak on 5/17/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class ValueViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var array = ["ETH", "XRP", "MKR", "JHT"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    var classTrans = ["Sales revenue"]
    var classAmount = ["14.94 $"]
    var gasAmount = ["0.34 $"]
    
    var gasFee = ["Transfer fee"]
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        picker.dataSource = self
        picker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func refreshTables(_ sender: Any) {
        table.reloadData()
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
extension ValueViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (segment.selectedSegmentIndex == 0){
        return classTrans.count
        }
        else {return gasFee.count}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        debugPrint(segment.selectedSegmentIndex)
        if (segment.selectedSegmentIndex == 0) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "classTrans", for: indexPath) as? TransTableViewCell {
                cell.amount.text = classAmount[indexPath.row]
                cell.classes.text = classTrans[indexPath.row]
                return cell
            }
            else {return UITableViewCell()}
            
        }
        else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "gasFee", for: indexPath) as? FeeTableViewCell {
                cell.gasFee.text = gasFee[indexPath.row]
                cell.sumAmount.text = gasAmount[indexPath.row]
                return cell
            
            }
        }
        return UITableViewCell()
    }
    
    
}

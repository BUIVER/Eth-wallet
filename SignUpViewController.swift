//
//  SignInViewController.swift
//  1223
//
//  Created by Ivan Ermak on 5/4/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBAction func startCreation(_ sender: Any) {
        let registerModel = ClientOperations()
        registerModel.createAccount(login: "", password: "")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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

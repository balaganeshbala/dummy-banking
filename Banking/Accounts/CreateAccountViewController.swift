//
//  CreateAccountViewController.swift
//  Banking
//
//  Created by Balaganesh S on 24/05/19.
//  Copyright © 2019 Juspay. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet var accountNameField: UITextField!
    @IBOutlet var bankNameField: UITextField!
    @IBOutlet var accountNumberField: UITextField!
    
    var stateController: StateController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard (segue.identifier == "SaveAccountSegue") else {
            return
        }
        guard let accountName = accountNameField.text, let bankName = bankNameField.text, let accountNumber = accountNumberField.text else {
            return
        }
        guard accountName.count > 0 && bankName.count > 0 && accountNumber.count > 0 else {
            return
        }
        let account = Account.init(name: accountName, bank: bankName, number: accountNumber, transactions: [])
        stateController.add(account)
        
    }

}

//
//  CreateTransactionViewController.swift
//  Banking
//
//  Created by Balaganesh S on 24/05/19.
//  Copyright © 2019 Juspay. All rights reserved.
//

import UIKit

protocol CreateTransactionViewControllerDelegate: class {
    func add(transaction: Transaction)
}

class CreateTransactionViewController: UIViewController {
    
    weak var delegate: CreateTransactionViewControllerDelegate?

    var newTransactionView: CreateTransactionView {
        return view as! CreateTransactionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(hideKeyboard))
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "SaveTransactionSegue" else {
            return
        }
        guard let amount = newTransactionView.amount,
            let description = newTransactionView.transactionDescription,
            let category = newTransactionView.selectedCategory else {
                return
        }
        let newTransaction = Transaction.init(amount: amount, description: description, category: category, date: Date())
        delegate?.add(transaction: newTransaction)
    }

}

extension CreateTransactionViewController {
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
}

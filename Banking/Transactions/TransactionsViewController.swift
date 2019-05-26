//
//  TransactionsViewController.swift
//  Banking
//
//  Created by Balaganesh S on 24/05/19.
//  Copyright © 2019 Juspay. All rights reserved.
//

import UIKit

class TransactionsViewController: UITableViewController {
    
    @IBOutlet var transactionsTableView: UITableView!
    
    @IBOutlet var accountBalanceLabel: UILabel!
    @IBOutlet var accountNumberLabel: UILabel!
    
    var stateController: StateController!
    var account: Account!
    
    fileprivate var dataSource: TransactionsDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = account.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.accountBalanceLabel.text = account.balance.rupeesFormatting
        self.accountNumberLabel.text = account.number.accountNumberFormatting
        self.dataSource = TransactionsDataSource(transactions: account.transactions)
        self.transactionsTableView.dataSource = self.dataSource
        self.transactionsTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let navigationController = segue.destination as? UINavigationController,
            let createTransactionViewController = navigationController.viewControllers.first as? CreateTransactionViewController {
            createTransactionViewController.delegate = self
        }
    }
    
    @IBAction func cancelTransactionCreation(_ segue: UIStoryboardSegue) {}
    @IBAction func saveTransaction(_ segue: UIStoryboardSegue) {}
}

extension TransactionsViewController: CreateTransactionViewControllerDelegate {
    func add(transaction: Transaction) {
        account.transactions.append(transaction)
        stateController.update(account)
    }
}

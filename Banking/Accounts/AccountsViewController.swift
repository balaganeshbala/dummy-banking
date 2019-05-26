//
//  AccountsViewController.swift
//  Banking
//
//  Created by Balaganesh S on 24/05/19.
//  Copyright © 2019 Juspay. All rights reserved.
//

import UIKit

class AccountsViewController: UITableViewController {

    @IBOutlet weak var accountsTableView: UITableView!
    
    var stateController: StateController!
    
    fileprivate var dataSource: AccountsDataSource!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource = AccountsDataSource(accounts: stateController.accounts)
        accountsTableView.dataSource = dataSource
        accountsTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier! {
        case "TransactionsSegue":
            if let transactionsViewController = segue.destination as? TransactionsViewController, let selectedIndex = tableView.indexPathForSelectedRow?.row {
                let account = dataSource.accounts[selectedIndex]
                transactionsViewController.account = account
                transactionsViewController.stateController = self.stateController
            }
            break
        case "CreateAccountSegue":
            if let navigationController = segue.destination as? UINavigationController, let createAccountViewController = navigationController.viewControllers.first as? CreateAccountViewController {
                createAccountViewController.stateController = self.stateController
            }
            break
        default:
            break
        }
    }
    
    @IBAction func cancelAccountCreation(_ segue: UIStoryboardSegue) {}
    @IBAction func saveAccount(_ segue: UIStoryboardSegue) {}
        
}

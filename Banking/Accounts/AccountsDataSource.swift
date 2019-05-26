//
//  AccountsDataSource.swift
//  Banking
//
//  Created by Balaganesh S on 24/05/19.
//  Copyright © 2019 Juspay. All rights reserved.
//

import UIKit

class AccountsDataSource: NSObject {
    var accounts: [Account]
    
    init(accounts: [Account]) {
        self.accounts = accounts
    }
}

extension AccountsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountsTableViewCell
        let index = indexPath.row
        let account = accounts[index]
        cell.model = AccountsTableViewCell.Model(account: account, index: index)
        return cell
    }
    
}

//
//  TransactionsDataSource.swift
//  Banking
//
//  Created by Balaganesh S on 24/05/19.
//  Copyright © 2019 Juspay. All rights reserved.
//

import UIKit

class TransactionsDataSource: NSObject {
    var transactions: [Transaction]!
    
    init(transactions: [Transaction]) {
        self.transactions = transactions
    }
}

extension TransactionsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionsTableViewCell
        let index = indexPath.row
        let transaction = transactions[index]
        cell.model = TransactionsTableViewCell.Model(trasaction: transaction)
        return cell
    }
    
    
}

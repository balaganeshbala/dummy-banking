//
//  StateController.swift
//  Banking
//
//  Created by Balaganesh S on 24/05/19.
//  Copyright © 2019 Juspay. All rights reserved.
//

import UIKit

class StateController: NSObject {
    
    fileprivate let storageController: StorageController
    fileprivate(set) var accounts: [Account]
    
    init(storageController: StorageController) {
        self.storageController = storageController
        self.accounts = storageController.fetchAccounts()
    }
    
    func add(_ account: Account) {
        accounts.append(account)
        storageController.save(accounts)
    }
    
    func update(_ account: Account) {
        for (index, storedAccount) in accounts.enumerated() {
            guard storedAccount.number == account.number else {
                continue
            }
            accounts[index] = account
            storageController.save(accounts)
            break
        }
    }
}

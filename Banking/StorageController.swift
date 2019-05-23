//
//  StorageController.swift
//  Banking
//
//  Created by Balaganesh S on 23/05/19.
//  Copyright © 2019 Juspay. All rights reserved.
//

import UIKit

struct Transaction {
    let amount: Float
    let description: String
    let category: TransactionCategory
    let date: Date
}

extension Transaction {
    var plistRepresentation: [String: AnyObject] {
        return [
            "amount": amount as AnyObject,
            "description": description as AnyObject,
            "category": category.rawValue as AnyObject,
            "date": amount as AnyObject
        ]
    }
    
    init(plist: [String : AnyObject]) {
        amount = plist["amount"] as! Float
        description = plist["description"] as! String
        category = TransactionCategory(rawValue: plist["category"] as! String)!
        date = plist["date"] as! Date
    }
}

enum TransactionCategory: String {
    case income
    case groceries
    case utilities
    case home
    case transport
    case fun
}

struct Account {
    let accountName: String
    let bankName: String
    let accountNumber: String
    var transactions: [Transaction]
    var totalAmount: Float {
        var total: Float = 0.0
        for transaction in transactions {
            total += transaction.category == .income ? transaction.amount * 1.0 : transaction.amount * -1.0
        }
        return total
    }
}

extension Account {
    var plistRepresentation: [String: AnyObject] {
        return [
            "accountName": accountName as AnyObject,
            "bankName": bankName as AnyObject,
            "accountNumber": accountNumber as AnyObject,
            "transaction": transactions.map({ $0.plistRepresentation }) as AnyObject
        ]
    }
    
    init(plist: [String : AnyObject]) {
        accountName = plist["accountName"] as! String
        bankName = plist["bankName"] as! String
        accountNumber = plist["accountNumber"] as! String
        transactions = (plist["transactions"] as! [[String: AnyObject]]).map(Transaction.init(plist:))
    }
}

class StorageController: NSObject {

}

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
            "date": date as AnyObject
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
    case shopping
    case utilities
    case home
    case transport
    case fun
}

extension TransactionCategory {
    struct Appearance {
        var color: UIColor
        var image: UIImage
    }
    
    var appearance: Appearance {
        switch self {
        case .income: return Appearance(color: .validGreen, image: UIImage.init(named: "icon_income")!)
        case .shopping: return Appearance(color: .red, image: UIImage.init(named: "icon_shopping")!)
        case .utilities: return Appearance(color: .red
            , image: UIImage.init(named: "icon_utilities")!)
        case .home: return Appearance(color: .red, image: UIImage.init(named: "icon_home")!)
        case .transport: return Appearance(color: .red, image: UIImage.init(named: "icon_transport")!)
        case .fun: return Appearance(color: .red, image: UIImage.init(named: "icon_fun")!)
        }
    }
}

struct Account {
    let name: String
    let bank: String
    let number: String
    var transactions: [Transaction]
    var balance: Float {
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
            "name": name as AnyObject,
            "bank": bank as AnyObject,
            "number": number as AnyObject,
            "transactions": transactions.map({ $0.plistRepresentation }) as AnyObject
        ]
    }
    
    init(plist: [String : AnyObject]) {
        name = plist["name"] as! String
        bank = plist["bank"] as! String
        number = plist["number"] as! String
        transactions = (plist["transactions"] as! [[String: AnyObject]]).map(Transaction.init(plist:))
    }
}

class StorageController: NSObject {

    fileprivate let documentsDirectoryURL = FileManager.default
        .urls(for: .documentDirectory, in: .userDomainMask)
        .first!
    
    fileprivate var accountsFileURL: URL {
        return documentsDirectoryURL
            .appendingPathComponent("Accounts")
            .appendingPathExtension("plist")
    }
    
    func save(_ accounts: [Account]) {
        let accountPlist = accounts.map({ $0.plistRepresentation }) as NSArray
        accountPlist.write(to: accountsFileURL, atomically: true)
    }
    
    func fetchAccounts() -> [Account] {
        guard let accountPlists = NSArray(contentsOf: accountsFileURL) as? [[String: AnyObject]] else {
            return []
        }
        return accountPlists.map(Account.init(plist:))
    }
}

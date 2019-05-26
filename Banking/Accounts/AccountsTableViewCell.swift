//
//  AccountsTableViewCell.swift
//  Banking
//
//  Created by Balaganesh S on 24/05/19.
//  Copyright © 2019 Juspay. All rights reserved.
//

import UIKit

class AccountsTableViewCell: UITableViewCell {

    @IBOutlet var accountNameLabel: UILabel!
    @IBOutlet var totalAmountLabel: UILabel!
    @IBOutlet var bankNameLabel: UILabel!
    @IBOutlet var accountNumberLabel: UILabel!
    @IBOutlet var coloredView: UIView!
    
    var model: Model? {
        didSet {
            guard let model = model else {
                return
            }
            accountNameLabel.text = model.name
            totalAmountLabel.text = model.total
            bankNameLabel.text = model.bank
            accountNumberLabel.text = model.number
            coloredView.backgroundColor = model.color
        }
    }
}

extension AccountsTableViewCell {
    struct Model {
        let name: String
        let total: String
        let bank: String
        let number: String
        let color: UIColor
        
        init(account: Account, index: Int) {
            name = account.name
            total = account.balance.rupeesFormatting
            bank = account.bank
            number = account.number.accountNumberFormatting
            color = UIColor.color(for: index)
        }
    }
}

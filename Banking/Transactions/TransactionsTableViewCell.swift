//
//  TransactionsTableViewCell.swift
//  Banking
//
//  Created by Balaganesh S on 24/05/19.
//  Copyright © 2019 Juspay. All rights reserved.
//

import UIKit

class TransactionsTableViewCell: UITableViewCell {
    
    @IBOutlet var categoryImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    
    var model: Model? {
        didSet {
            guard let model = model else {
                return
            }
            categoryImageView.image = model.categoryImage
            descriptionLabel.text = model.description
            dateLabel.text = model.date
            amountLabel.text = model.amount
            amountLabel.textColor = model.categoryColor
        }
    }
}

extension TransactionsTableViewCell {
    struct Model {
        let description: String
        let amount: String
        let categoryImage: UIImage
        let categoryColor: UIColor
        let date: String
        
        init(trasaction: Transaction) {
            description = trasaction.description
            amount = trasaction.amount.rupeesFormatting
            categoryImage = trasaction.category.appearance.image
            categoryColor = trasaction.category.appearance.color
            date = trasaction.date.transactionFormatting
        }
    }
}

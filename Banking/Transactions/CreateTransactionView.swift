//
//  CreateTransactionView.swift
//  Banking
//
//  Created by Balaganesh S on 25/05/19.
//  Copyright © 2019 Juspay. All rights reserved.
//

import UIKit

class CreateTransactionView: UIView {

    @IBOutlet var amountField: UITextField!
    @IBOutlet var descriptionField: UITextField!
    @IBOutlet var categoryButtons: [UIButton]!
    @IBOutlet var ringViews: [UIView]!
    
    fileprivate var selectedIndex = 0
    
    var amount: Float? {
        guard let text = amountField.text else {
            return nil
        }
        return Float(text)
    }
    
    override func awakeFromNib() {
        resetRings()
        let firstRingView = ringViews[selectedIndex]
        firstRingView.layer.borderColor = UIColor.littleDarkBlue.cgColor
    }
    
    var transactionDescription: String? {
        return descriptionField.text
    }
    
    var selectedCategory: TransactionCategory? {
        switch selectedIndex {
        case 0: return .income
        case 1: return .shopping
        case 2: return .utilities
        case 3: return .home
        case 4: return .transport
        case 5: return .fun
        default: return nil
        }
    }
    
    @IBAction func selectCategory(_ sender: UIButton) {
        resetRings()
        selectedIndex = categoryButtons.firstIndex(of: sender)!
        let selectedRingView = ringViews[selectedIndex]
        selectedRingView.layer.borderColor = UIColor.littleDarkBlue.cgColor
    }
    
}

fileprivate extension CreateTransactionView {
    func resetRings() {
        for ringView in ringViews {
            ringView.layer.borderColor = UIColor.clear.cgColor
        }
    }
}

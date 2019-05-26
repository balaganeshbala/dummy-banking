//
//  CommonExtensions.swift
//  Banking
//
//  Created by Balaganesh S on 26/05/19.
//  Copyright © 2019 Juspay. All rights reserved.
//

import UIKit

extension UIColor {
    class var lightGrassGreen: UIColor {
        return UIColor(red: 128.0 / 255.0, green: 222.0 / 255.0, blue: 110.0 / 255.0, alpha: 1.0)
    }
    
    class var skyBlue: UIColor {
        return UIColor(red: 84.0 / 255.0, green: 199.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
    }
    
    class var littleDarkBlue: UIColor {
        return UIColor(red: 52.0 / 255.0, green: 152.0 / 255.0, blue: 219.0 / 255.0, alpha: 1.0)
    }
    
    class var seafoamBlue: UIColor {
        return UIColor(red: 93.0 / 255.0, green: 220.0 / 255.0, blue: 191.0 / 255.0, alpha: 1.0)
    }
    
    class var liliac: UIColor {
        return UIColor(red: 201.0 / 255.0, green: 138.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    }
    
    class var sunflowerYellow: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 205.0 / 255.0, blue: 0.0, alpha: 1.0)
    }
    
    class var carnation: UIColor {
        return UIColor(red: 253.0 / 255.0, green: 100.0 / 255.0, blue: 147.0 / 255.0, alpha: 1.0)
    }
    
    class var peach: UIColor {
        return UIColor(red: 253.0 / 255.0, green: 169.0 / 255.0, blue: 123.0 / 255.0, alpha: 1.0)
    }
    
    class var slate: UIColor {
        return UIColor(red: 80.0 / 255.0, green: 107.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0)
    }
    
    class var darkLimeGreen: UIColor {
        return UIColor(red: 111.0 / 255.0, green: 221.0 / 255.0, blue: 0.0, alpha: 1.0)
    }
    
    class var validGreen: UIColor {
        return UIColor(red: 25.0 / 255.0, green: 180.0 / 255.0, blue: 25.0 / 255.0, alpha: 1.0)
    }
    
    class func color(for index: Int) -> UIColor {
        switch index % 5 {
        case 0: return .liliac
        case 1: return .seafoamBlue
        case 2: return .sunflowerYellow
        case 3: return .carnation
        default: return .peach
        }
    }
}

extension Float {
    var rupeesFormatting: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "₹"
        return formatter.string(from: NSNumber(value: self))!
    }
}

extension String {
    var accountNumberFormatting: String {
        var formattedString = ""
        let characters = Array(self)
        for (index, character) in characters.enumerated() {
            if index % 4 < 3 || index == characters.count - 1 {
                formattedString.append(character)
            } else {
                formattedString.append("\(character) ")
            }
        }
        return formattedString
    }
}

extension Date {
    var transactionFormatting: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: self)
    }
}

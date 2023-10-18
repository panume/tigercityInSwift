//
//  Adapter.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/22.
//

import Foundation

class Adapter {
    class func priceYuan(price: Double) -> String {
        let number = NSDecimalNumber(string: "\(price)")
        let ouncesDecimal: NSDecimalNumber = NSDecimalNumber(value: price)
        let result = ouncesDecimal.compare(NSDecimalNumber.zero)
        let mode: NSDecimalNumber.RoundingMode = result != .orderedAscending ? .down : .up
        let behavior: NSDecimalNumberHandler = NSDecimalNumberHandler(roundingMode: mode,
                                                                      scale: 2,
                                                                      raiseOnExactness: false,
                                                                      raiseOnOverflow: false,
                                                                      raiseOnUnderflow: false,
                                                                      raiseOnDivideByZero: false)
        let roundedOunces: NSDecimalNumber = ouncesDecimal.rounding(accordingToBehavior: behavior)
        return  roundedOunces.stringValue
      
    }
}


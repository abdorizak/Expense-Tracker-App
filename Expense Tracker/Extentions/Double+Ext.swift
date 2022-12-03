//
//  Double+Ext.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 8/26/22.
//

import Foundation


extension Double {
    func toString() -> String {
        return String(self)
    }
    
    func toInt() -> Int {
        return Int(self)
    }
    
    var formatDouble: String {
        return String(format: "%.01f", self)
    }
    
    func reduceScale(to places: Int) -> Double {
        let multiplier = pow(10, Double(places))
        let newDecimal = multiplier * self // move the decimal right
        let truncated = Double(Int(newDecimal)) // drop the fraction
        let originalDecimal = truncated / multiplier // move the decimal back
        return originalDecimal
    }
    
    func formatNumber() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""
        
        switch num {
        case 1_000_000_000...:
            var formatted = num / 1_000_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)B"
            
        case 1_000_000...:
            var formatted = num / 1_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)M"
            
        case 1_000...:
            var formatted = num / 1_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)K"
            
        case 0...:
            return "\(self)"
            
        default:
            return "\(sign)\(self)"
        }
    }
}

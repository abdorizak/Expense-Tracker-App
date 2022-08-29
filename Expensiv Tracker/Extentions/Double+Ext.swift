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
}

//
//  BalanceFormater.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 6/6/22.
//

// UI DESING

import UIKit

protocol BalanceFormater {
    func makeFormattedBalance(dollar: String) -> NSMutableAttributedString
}

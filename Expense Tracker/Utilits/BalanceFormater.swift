//
//  BalanceFormater.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 6/6/22 💻.
//  Copyright © 2023 Abdirizak Hassan DR X. All Rights Reserved.
//
// GitHub: https://github.com/abdorizak
// Website: https://abdorizak.dev

import UIKit

protocol BalanceFormater {
    func makeFormattedBalance(dollar: String) -> NSMutableAttributedString
}

//
//  User.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/1/22.
//
// UI DESING

import UIKit

struct User: Decodable {
    let avatar: String
    let name: String
}

struct UserBalanceIncomeExpense: Decodable {
    let status: Int
    let message: String
    let user: User
    let balance: Double
    let income:  Double
    let expense: Double
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case user
        case balance = "balance"
        case income  = "userincome"
        case expense = "userExpense"
    }
}


struct UserIncome: Decodable, Hashable {
    let status: Int
    let message: String
    let userIncome: [Double]
}

struct UserExpenses: Decodable, Hashable {
    let status: Int
    let message: String
    let userExpense: [Double]
}

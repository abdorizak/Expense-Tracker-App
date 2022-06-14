//
//  User.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/1/22.
//
// UI DESING

import UIKit

struct LoginBody: Codable {
    let username: String
    let password: String
}

struct LoginResponse: Codable {
    let success: Int
    let userInfo: String    // userId
    let access_token: String
}


struct User {
    let fullname: String
    let email: String
}

struct UserIncomeAndExpense {
    let balance: Double
    let income: Double
    let Expense: Double
}

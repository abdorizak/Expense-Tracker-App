//
//  User.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/1/22.
//

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

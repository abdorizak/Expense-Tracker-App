//
//  SignUp.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 9/12/22.
//

import Foundation


struct SignUp: Codable {
    let name: String
    let email: String
    let phone: String
    let username: String
    let password: String
    let pin: Int
}


struct SignUpResponse: Decodable {
    let status: Int?
    let message: String?
}

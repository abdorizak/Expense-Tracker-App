//
//  Login.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 8/28/22.
//

import Foundation

struct LoginBody: Codable {
    let username: String
    let password: String
}

struct Pin: Codable {
    let pin: Int
}

struct LoginResponse: Decodable {
    let status: Int?
    let message: String?
    let userInfo: String?
    let accessToken: String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case userInfo = "user"
        case accessToken = "access_token"
    }
}

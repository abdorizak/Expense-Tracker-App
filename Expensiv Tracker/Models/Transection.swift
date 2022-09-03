//
//  Transection.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 4/24/22.
//
// UI DESING

import Foundation

struct Transections {
    let title: String
    let description: String
    let type: String
    let ammount: Double
}

struct Transactions: Decodable {
    let status: Int
    let transaction: [Transaction]
}

struct Transaction: Decodable {
    let id: String
    let userID: String
    let title: String
    let type: String
    let description: String
    let amount: Double
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userID
        case title
        case type
        case description
        case amount
        case date
    }
}

struct TransactionBody: Codable, Equatable {
    let userID: String
    let type: String
    let title: String
    let description: String
    let amount: Double
}

struct TransactionReponse: Decodable {
    let message: String?
    let status: Int?
}

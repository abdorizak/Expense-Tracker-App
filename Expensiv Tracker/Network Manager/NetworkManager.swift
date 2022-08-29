//
//  NetworkManager.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 7/16/22.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private let decoder = JSONDecoder()
    private let userID = UserDefaults.standard.string(forKey: "user_id")
    
    // init
    private init() {
        decoder.keyDecodingStrategy  = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }
    
    
    func getDashboardData() async throws -> UserBalanceIncomeExpense {
        let request = try await createRequest(with: URL(string: API.baseURL + "statements/info/\(userID ?? "N/A")"), type: .GET)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw ExError.invalidResponse }
        
        do {
            return try decoder.decode(UserBalanceIncomeExpense.self, from: data)
        } catch {
            throw ExError.inValidData
        }
    }
    
    func getTransaction() async throws -> Transactions {
        let request = try await createRequest(with: URL(string: API.baseURL + "transactions/\(userID ?? "N/A")"), type: .GET)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw ExError.invalidResponse }
        
        do {
            return try decoder.decode(Transactions.self, from: data)
        } catch {
            throw ExError.inValidData
        }
    }
    
    func getUserIncome() async throws -> UserIncome {
        let request = try await createRequest(with: URL(string: API.baseURL + "statements/userIncome/\(userID ?? "N/A")"), type: .GET)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw ExError.invalidResponse }
        
        do {
            let userIncome = try decoder.decode(UserIncome.self, from: data)
            return userIncome
        } catch {
            throw ExError.inValidData
        }
    }
    
    func getUserExpense() async throws -> UserExpenses {
        let request = try await createRequest(with: URL(string: API.baseURL + "statements/userExpense/\(userID ?? "N/A")"), type: .GET)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw ExError.invalidResponse }
        
        do {
            return try decoder.decode(UserExpenses.self, from: data)
        } catch {
            throw ExError.inValidData
        }
    }
    
    //    func makeTransaction(_ type: String, _ title: String, _ description: String, _ amount: Double) async throws -> TransactionReponse {
    //        let request = try await createRequest(with: URL(string: API.baseURL + "transactions/usertransactions"), type: .POST, body: TransactionBody(userID: userID ?? "N/A", type: type, title: title, description: description, amount: amount))
    //
    //        let (data, response) = try await URLSession.shared.data(for: request)
    //
    //        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw ExError.invalidResponse }
    //
    //        do{
    //            return try decoder.decode(TransactionReponse.self, from: data)
    //        } catch {
    //            throw ExError.inValidData
    //        }
    //    }
    
    
    
    private func createRequest(with url: URL?, type: HTTPMethod, body: Data? = nil) async throws -> URLRequest {
        let token = try await AuthManager.shared.withValidate()
        
        guard let apiURL = url else {
            throw ExError.invalidURL
        }
        
        var request = URLRequest(url: apiURL)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
        request.httpMethod = type.rawValue
        if type.rawValue == "POST" {
            if let body = body {
                request.httpBody = try JSONEncoder().encode(body)
            }
        }
        
        return request
    }
    
}

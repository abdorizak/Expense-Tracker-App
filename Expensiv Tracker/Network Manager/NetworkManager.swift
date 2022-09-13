//
//  NetworkManager.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 7/16/22.
//

import UIKit

final class NetworkManager {
    static  let shared          = NetworkManager()
    private let cache           = NSCache<NSString, UIImage>()
    private let decoder         = JSONDecoder()
    private let userID          = UserDefaults.standard.string(forKey: "user_id")
    
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
    
    func makeTransaction(_ type: String, _ title: String, _ description: String, _ amount: Double) async throws -> TransactionReponse {
        let request = try await createRequest(with: URL(string: API.baseURL + "transactions/usertransactions"), type: .POST, body: TransactionBody(userID: userID!, type: type, title: title, description: description, amount: amount))
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw ExError.invalidResponse }
        
        do{
            return try decoder.decode(TransactionReponse.self, from: data)
        } catch {
            throw ExError.inValidData
        }
    }
    
    
    //
    private func createRequest(with url: URL?, type: HTTPMethod = .GET) async throws -> URLRequest {
        let token = try await AuthManager.shared.withValidate()

        guard let apiURL = url else {
            throw ExError.invalidURL
        }

        var request = URLRequest(url: apiURL)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
        request.httpMethod = type.rawValue
        return request
    }
    
    private func createRequest<T: Encodable>(with url: URL?, type: HTTPMethod, body: T?) async throws -> URLRequest {
        let token = try await AuthManager.shared.withValidate()
        
        guard let apiURL = url, let body = body else {
            throw ExError.invalidURL
        }
        
        var request = URLRequest(url: apiURL)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = type.rawValue
        if type.rawValue == "POST" || type.rawValue == "PUT" {
            request.httpBody = try JSONEncoder().encode(body)
        }
        
        return request
    }
    
    func Signup(fullname: String, email: String, mobile: String, username: String, pin: Int, passowrd: String) async throws -> SignUpResponse {
        
        guard let url = URL(string: API.baseURL + "users/create-user") else {
            throw ExError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(SignUp(name: fullname, email: email, phone: mobile, username: username, password: passowrd, pin: pin))
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        print(response)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw ExError.invalidResponse }
        do {
            return try decoder.decode(SignUpResponse.self, from: data)
        } catch {
            throw ExError.inValidData
        }
    }
    
    func downloadImage(from urlString: String) async -> UIImage? {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) { return image }
        guard let url = URL(string: urlString) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return nil }
            cache.setObject(image, forKey: cacheKey)
            return image
        } catch {
            return nil
        }
    }
    
}

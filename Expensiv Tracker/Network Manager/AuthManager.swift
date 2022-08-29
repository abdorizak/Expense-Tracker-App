//
//  AuthManager.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 2/28/22.
//
// UI DESING

import UIKit

final class AuthManager {
    static let shared   = AuthManager()
    private let decoder         = JSONDecoder()
    
    // init
    private init() { }
    
    var isSingedIn: Bool {
        return accessToken != nil
    }
    
    private var accessToken: String? {
        return UserDefaults.standard.string(forKey: "access_token")
    }
    
    func withValidate() async throws -> String {
        guard let token = accessToken else {
            throw ExError.NotFound
        }
        return token
    }
    
    func login(username: String, password: String) async throws -> LoginResponse {
        guard let url = URL(string: API.baseURL + "auth/login") else {
            throw ExError.invalidURL
        }
        
        let body = LoginBody(username: username, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw ExError.invalidResponse }
        
        do {
            let res = try decoder.decode(LoginResponse.self, from: data)
            catchToken(result: res)
            return res
        } catch {
            throw ExError.inValidData
        }
    }
    
    func login(with pin: Int) async throws -> LoginResponse {
        guard let url = URL(string: API.baseURL + "auth/pin") else {
            throw ExError.invalidURL
        }
        
        let body = Pin(pin: pin)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw ExError.invalidResponse }
        do {
            let res = try decoder.decode(LoginResponse.self, from: data)
            catchToken(result: res)
            return res
        } catch {
            throw ExError.inValidData
        }
    }
    
    
    private func catchToken(result: LoginResponse) {
        UserDefaults.standard.setValue(result.accessToken, forKey: "access_token")
        UserDefaults.standard.setValue(result.userInfo, forKey: "user_id")
    }
    
    func SingOut() -> Bool {
        UserDefaults.standard.setValue(nil, forKey: "access_token")
        return true
    }
    
    
    
}

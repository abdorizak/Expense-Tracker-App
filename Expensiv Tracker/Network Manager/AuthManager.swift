//
//  AuthManager.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 2/28/22.
//

import UIKit

final class AuthManager {
    
    static let shared = AuthManager()
    
    private init() {}
    
    var isSingedIn: Bool {
        return true
    }
    
    private var accessToken: String? {
        return UserDefaults.standard.string(forKey: "access_token")
    }
    
    func withValidate(completion: @escaping (String) -> Void) {
        if let token = accessToken {
            completion(token)
        }
    }
    
    func login(username: String, password: String, completion: @escaping (Result<LoginResponse, ExError>) -> Void) {
        guard let url = URL(string: URL_S.login_URL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let body = LoginBody(username: username, password: username)
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { data, res, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.inValidData))
                return
            }
                  
            guard let httpResponse = res as? HTTPURLResponse, httpResponse.statusCode == 200
            else {
                completion(.failure(.httpResponse))
                return
            }
            
            do {
                let login_response = try JSONDecoder().decode(LoginResponse.self, from: data)
                completion(.success(login_response))
            } catch {
                completion(.failure(.invalidCredentials))
            }
        }.resume()
    }
    
    private func catchToken(result: LoginResponse) {
        UserDefaults.standard.setValue(result.access_token, forKey: "access_token")
    }
    
}

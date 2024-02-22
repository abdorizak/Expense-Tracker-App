//
//  TabBarVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/1/22.💻
// Copyright © 2023 Abdirizak Hassan DR X. All Rights Reserved.
//
// GitHub: https://github.com/abdorizak
// Website: https://abdorizak.dev

import UIKit
import LocalAuthentication

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        authenticateUser()
    }
    
    private func authenticateUser() {
        let isFaceIDEnabled = UserDefaults.standard.bool(forKey: "isFaceIDEnabled")
        
        debugPrint("Checking.. \(isFaceIDEnabled)")
        // Only proceed with authentication if Face ID is enabled in settings
        if isFaceIDEnabled {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate to access the app."
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, authenticationError in
                    DispatchQueue.main.async {
                        if !success {
                            // Handle authentication failure
                            let alert = UIAlertController(title: "Authentication Failed", message: "Please try again.", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self?.present(alert, animated: true, completion: nil)
                        }
                    }
                }
            } else {
                // Face ID is not available or not enabled
                print("Face ID is not available or not enabled.")
            }
        } else {
            print("Face ID authentication is disabled in settings.")
        }
    }
    
    
    private func configureTabBar() {
        view.backgroundColor = .systemBackground
        viewControllers = [configHomeVC(), addExpensesVC(), transectionVC()]
        tabBar.selectionIndicatorImage = UIImage(named: "Selected")
        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 20
        additionalSafeAreaInsets.bottom = 10
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        tabBar.tintColor = UIColor(named: "TabBarTint")
    }
    
    private func configHomeVC() -> UINavigationController {
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house.fill"), tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }
    
    private func addExpensesVC() -> UINavigationController  {
        let addexpensesVC = AddIncomeAndExpensesVC()
        addexpensesVC.modalPresentationStyle = .overCurrentContext
        addexpensesVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "plus.circle.fill"), tag: 1)
        return UINavigationController(rootViewController: addexpensesVC)
    }
    
    private func transectionVC() -> UINavigationController {
        let tranVC = TransectionsVC()
        tranVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "chart.pie.fill"), tag: 2)
        return UINavigationController(rootViewController: tranVC)
        
    }
    
}

//
//  TabBarVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/1/22.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    private func configureTabBar() {
        view.backgroundColor = .systemBackground
        viewControllers = [configHomeVC()]
    }
    
    private func configHomeVC() -> UINavigationController {
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: "house.fill", image: UIImage(systemName: ""), tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }
    
    private func addExpensesVC() -> UINavigationController {
        let vc
        
    }

}

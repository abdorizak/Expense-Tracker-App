//
//  TabBarVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/1/22.
//
// UI DESING

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
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

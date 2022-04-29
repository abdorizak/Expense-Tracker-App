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
//        if #available(iOS 14.0, *) {
//            let appearance = UITabBarAppearance()
//            appearance.configureWithOpaqueBackground()
//            UITabBar.appearance().standardAppearance = appearance
//            UITabBar.appearance().scrollEdgeAppearance = appearance
//        }
    }
    
    private func configureTabBar() {
        view.backgroundColor = .systemBackground
        viewControllers = [configHomeVC(), addExpensesVC(), transectionVC()]
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
        tranVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "waveform"), tag: 2)
        return UINavigationController(rootViewController: tranVC)
        
    }

}

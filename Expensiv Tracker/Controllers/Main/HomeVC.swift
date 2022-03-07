//
//  ViewController.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 2/28/22.
//

import UIKit

class HomeVC: UIViewController {
    
    private let headerView          = UIView()
    private let balanceInfo         = CardView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubViews(headerView, balanceInfo)
        ConfigureHeaderView()
    }


    
    private func ConfigureHeaderView() {
        headerView.backgroundColor = .tertiarySystemFill
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.layer.cornerRadius = 5
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
    }
    
    
    private func configureShowBlanceView() {
        
        NSLayoutConstraint.activate([
            balanceInfo.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            balanceInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            balanceInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            balanceInfo.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    
    
    
    

}


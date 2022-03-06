//
//  ViewController.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 2/28/22.
//

import UIKit

class HomeVC: UIViewController {
    
    let headerView      = UIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(headerView )
    }


    
    private func layoutUI() {
        headerView.backgroundColor = .tertiarySystemFill
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.layer.cornerRadius = 5
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
    }
    
    

}


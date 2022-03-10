//
//  ViewController.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 2/28/22.
//

import UIKit

class HomeVC: UIViewController {
    
    private let headerView              = UIView()
    private let balanceInfo             = CardView()
    private let transectionsLabel       = CustomLabel(textAlignment: .left, fontSize: 24, textWeight: .medium, text: "Transections")
    private let tableView: UITableView  = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
        tableView.delegate   = self
        tableView.dataSource = self
        view.addSubViews(headerView, balanceInfo, transectionsLabel, tableView)
        ConfigureHeaderView()
        configureShowBlanceView()
        configTransectionLabel()
        configTableView()
    }


    
    private func ConfigureHeaderView() {
        headerView.backgroundColor = .tertiarySystemFill
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.layer.cornerRadius = 5
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    
    private func configureShowBlanceView() {
        
        NSLayoutConstraint.activate([
            balanceInfo.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            balanceInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            balanceInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            balanceInfo.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    
    private func configTransectionLabel() {
        NSLayoutConstraint.activate([
            transectionsLabel.topAnchor.constraint(equalTo: balanceInfo.bottomAnchor, constant: 30),
            transectionsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            transectionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            transectionsLabel.heightAnchor.constraint(equalToConstant: 26)
        ])
    }
    
    
    private func configTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: transectionsLabel.bottomAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
}


extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        return UITableViewCell()
    }
    
    
}


//
//  UserStatementVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 4/19/22.
//
// UI DESING

import UIKit

class UserStatementVC: UIViewController {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(TransectionTableViewCell.self, forCellReuseIdentifier: TransectionTableViewCell.identifier)
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
//        table.separatorStyle = .none
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configTableView()
    }
    
    func configTableView() {
        view.addSubview(tableView)
        tableView.delegate      = self
        tableView.dataSource    = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}


extension UserStatementVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransectionTableViewCell.identifier, for: indexPath) as! TransectionTableViewCell
        cell.selectionStyle = .none
        return cell
    }
 
}

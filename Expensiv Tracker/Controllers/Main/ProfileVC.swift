//
//  ProfileVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/27/22.
//

import UIKit

class ProfileVC: UIViewController {

    // MARK: - TableView
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    

}

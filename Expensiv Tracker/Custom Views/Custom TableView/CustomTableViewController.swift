//
//  CustomTableViewController.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 7/3/22.
//

import UIKit

class CustomTableViewController: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configTable() {
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        separatorStyle = .singleLine
    }
}

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
    
    convenience init(indicator: Bool, separtorStyle: UITableViewCell.SeparatorStyle, _ clas: AnyClass?, forCellReuseIdentifier: String) {
        self.init(frame: .zero, style: .plain)
        showsVerticalScrollIndicator = indicator
        translatesAutoresizingMaskIntoConstraints = false
        separatorStyle = separtorStyle
//        register(nib, forCellReuseIdentifier: forCellReuseIdentifier)
        register(clas, forCellReuseIdentifier: forCellReuseIdentifier)
    }
    
    private func configTable() {
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        separatorStyle = .singleLine
    }
}

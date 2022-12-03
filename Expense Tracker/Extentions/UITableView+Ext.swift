//
//  UITableView+Ext.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 8/27/22.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    

    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}

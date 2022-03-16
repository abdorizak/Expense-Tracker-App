//
//  CustomView.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/15/22.
//

import UIKit

class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func config() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor        = .tertiarySystemFill
        layer.shadowColor      = UIColor.black.cgColor
        layer.shadowOffset     = .zero
        layer.cornerRadius     = 30
        layer.shadowOpacity    = 0.1
        layer.shadowRadius     = 5
    }

}

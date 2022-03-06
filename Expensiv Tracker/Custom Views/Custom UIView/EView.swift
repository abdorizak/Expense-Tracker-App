//
//  EView.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/6/22.
//

import UIKit

class EView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configView() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = .zero
        layer.cornerRadius  = 5
        layer.shadowOpacity = 0.1
        layer.shadowRadius  = 5
    }
    
}

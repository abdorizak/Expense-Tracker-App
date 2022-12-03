//
//  GredientButton.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/16/22.
//
// UI DESING

import UIKit

class GradientButton: UIButton {
    
    private let gradient = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config() {
        translatesAutoresizingMaskIntoConstraints = false
        gradient.frame = bounds
        gradient.colors = [
            UIColor.systemOrange.cgColor,
            UIColor.systemPurple.cgColor,
            UIColor.systemTeal.cgColor,
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1 )
        gradient.cornerRadius = 15
        layer.addSublayer(gradient)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
}

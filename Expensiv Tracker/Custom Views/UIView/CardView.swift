//
//  CardView.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/6/22.
//

import UIKit

class CardView: UIView {
    
    private let gradient = CAGradientLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configCardView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configCardView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        gradient.colors = [
            UIColor.systemOrange.cgColor,
            UIColor.systemPurple.cgColor,
            UIColor.systemTeal.cgColor,
//            UIColor.systemRed.cgColor,
        ]
        layer.addSublayer(gradient)
        gradient.shadowColor = UIColor.black.cgColor
        gradient.shadowRadius = 5
        gradient.shadowOffset = .zero
        gradient.shadowOpacity = 0.2
        gradient.cornerRadius  = 10
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
}

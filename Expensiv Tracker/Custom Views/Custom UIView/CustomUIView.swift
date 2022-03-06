//
//  EView.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/6/22.
//

import UIKit

class EView: UIView {
    
    private let gradient = CAGradientLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func configView() {
        
        gradient.frame = bounds
        gradient.colors = [UIColor.systemPink.cgColor, UIColor.tintColor.cgColor, UIColor.systemOrange.cgColor, UIColor.tintColor.cgColor]
        
        gradient.cornerRadius  = 20
        gradient.shadowOffset  = .zero
        gradient.shadowOpacity = 0.2
        gradient.shadowRadius  = 5
        gradient.shadowColor   = UIColor.black.cgColor
        layer.addSublayer(gradient)
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = .zero
        layer.cornerRadius  = 10
        layer.shadowOpacity = 0.2
        layer.shadowRadius  = 5
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
    
}

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
    
//    convenience init() {
//        self.init(frame: .zero)
//        configWithShadows()
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func configWithShadows() {
//        translatesAutoresizingMaskIntoConstraints = false
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = .zero
//        layer.cornerRadius = 12
//        layer.shadowOpacity = 0.1
//        layer.shadowRadius = 10
//    }
//
    private func configCardView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        gradient.colors = [
            UIColor.systemOrange.cgColor,
            UIColor.systemPurple.cgColor,
            UIColor.systemTeal.cgColor,
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1 )
        layer.addSublayer(gradient)
        gradient.cornerRadius = 20
        gradient.shouldRasterize = true
        gradient.rasterizationScale = UIScreen.main.scale
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.2

    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
    
    
}

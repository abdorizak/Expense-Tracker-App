//
//  AvatarImageView.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/10/22.
//

import UIKit

class AvatarImageView: UIImageView {

    let placeHolderImage = Images.placeHolderImage
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configImage() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        layer.shadowOffset = .zero
        layer.shadowColor  = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.2
        clipsToBounds = true
        image = placeHolderImage
    }
    
    
}

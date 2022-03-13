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
    
    func configImage() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        image = placeHolderImage
    }
    
    
}

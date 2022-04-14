//
//  ProfileHeaderView.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 4/12/22.
//

import UIKit

class ProfileHeaderView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    var userImage       = AvatarImageView(frame: .zero)
    var user_fullName   = CustomLabel(textAlignment: .center, fontSize: 22, textWeight: .regular)
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        override var intrinsicContentSize: CGSize {
            return CGSize(width: UIView.noIntrinsicMetric, height: 250)
        }
        
        private func commonInit() {
            
            let bundle = Bundle(for: ProfileHeaderView.self)
            bundle.loadNibNamed("ProfileHeaderView", owner: self, options: nil)
            addSubview(contentView)
            
            contentView.translatesAutoresizingMaskIntoConstraints   = false
            userImage.translatesAutoresizingMaskIntoConstraints     = false
            user_fullName.translatesAutoresizingMaskIntoConstraints = false
            
            contentView.backgroundColor = .clear
            contentView.addSubViews(userImage, user_fullName)
            
            user_fullName.text = "Abdorizak Abdalla Hassan"
            userImage.contentMode = .scaleAspectFill
            userImage.layer.cornerRadius = 70
            userImage.clipsToBounds = true
            
            contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            
            
            NSLayoutConstraint.activate([
                
                contentView.topAnchor.constraint(equalTo: self.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                
                userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
                userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 133),
                userImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -133),
                userImage.heightAnchor.constraint(equalToConstant: 150),
                userImage.widthAnchor.constraint(equalToConstant: 150),
                
                user_fullName.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 20),
                user_fullName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                user_fullName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                user_fullName.widthAnchor.constraint(equalToConstant: 24)
                
            ])
            
        }
    
}

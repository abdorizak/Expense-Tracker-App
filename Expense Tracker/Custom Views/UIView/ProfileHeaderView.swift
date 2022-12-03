//
//  ProfileHeaderView.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 4/12/22.
//
// UI DESING

import UIKit

class ProfileHeaderView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    var userImage       = AvatarImageView(frame: .zero)
    var user_fullName   = CustomLabel(textAlignment: .center, fontSize: 22, textWeight: .regular)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    convenience init(user name: String, image userImage: String) {
        self.init(frame: .zero)
        self.user_fullName.text = name
        self.userImage.downloadImage(fromURL: "http://192.168.1.166:4400/" + userImage)
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
        userImage.contentMode = .scaleAspectFit
        userImage.layer.cornerRadius = userImage.bounds.width / 2
        userImage.clipsToBounds = true
        userImage.layer.borderWidth = 0.2
        userImage.layer.borderColor = UIColor.label.cgColor
        
        
        NSLayoutConstraint.activate([
            
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            userImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            userImage.heightAnchor.constraint(equalToConstant: 150),
            userImage.widthAnchor.constraint(equalToConstant: 150),
            
            user_fullName.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 20),
            user_fullName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            user_fullName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
        
    }
    
}

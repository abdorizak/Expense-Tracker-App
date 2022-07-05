//
//  HeaderVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/9/22.
//
// UI DESING

import UIKit

class HeaderVC: UIViewController {
    
    let userImage       = AvatarImageView(frame: .zero)
    let welcomeLabel    = CustomLabel(textAlignment: .left, fontSize: 20, textWeight: .ultraLight, text: "Hi Welcome")
    let fullnameLabel   = CustomLabel(textAlignment: .left, fontSize: 18, textWeight: .regular)

    init(Fullname user: String) {
        super.init(nibName: nil, bundle: nil)
        self.fullnameLabel.text = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubViews(userImage, welcomeLabel, fullnameLabel)
        layoutUI()
    }
    
    func layoutUI() {
        
        userImage.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userImage.widthAnchor.constraint(equalToConstant: 50),
            userImage.heightAnchor.constraint(equalToConstant: 50),
            
            welcomeLabel.topAnchor.constraint(equalTo: userImage.topAnchor),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            welcomeLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 8),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 22),

            fullnameLabel.bottomAnchor.constraint(equalTo: userImage.bottomAnchor),
            fullnameLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 8),
            fullnameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            fullnameLabel.heightAnchor.constraint(equalToConstant: 26),
        ])
        
    }

}

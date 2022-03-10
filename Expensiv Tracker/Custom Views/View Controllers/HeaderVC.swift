//
//  HeaderVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/9/22.
//

import UIKit

class HeaderVC: UIViewController {
    
    private let userImage       = AvatarImageView(frame: .zero)
    private let welcomeLabel    = CustomLabel(textAlignment: .left, fontSize: 18, textWeight: .light, text: "Hi Welcome")
    private let fullnameLabel   = CustomLabel(textAlignment: .left, fontSize: 18, textWeight: .regular, text: "Abdorizak Abdalla")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutUI()
    }
    
    
    func layoutUI() {
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
    }

}

//
//  ForgetPasswordTextFeild.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/3/22.
//

import UIKit

class ForgetPasswordTextFeild: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func config() {
        translatesAutoresizingMaskIntoConstraints = false
        
        textContentType = .username

        layer.cornerRadius = 10
        
        textColor       = .label
        tintColor       = .label
        
        textAlignment   = .left
        font            = UIFont.systemFont(ofSize: 17)
        minimumFontSize = 17
        
        backgroundColor     = .secondarySystemBackground
        autocorrectionType  = .no
        returnKeyType       = .go
        clearButtonMode     = .whileEditing
        placeholder         = "Enter your username"
    }

}

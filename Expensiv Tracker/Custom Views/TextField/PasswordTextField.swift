//
//  PasswordTextField.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/1/22.
//

import UIKit

class PasswordTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configpass()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configpass() {
        translatesAutoresizingMaskIntoConstraints = false
        
        textContentType     = .password
        isSecureTextEntry   = true
        
        layer.cornerRadius      = 5
//        layer.borderWidth       = 1
//        layer.borderColor       = UIColor.systemGray4.cgColor
        
        textColor               = .label
        tintColor               = .label
        
        textAlignment           = .left
        font                    = UIFont.systemFont(ofSize: 17)
        minimumFontSize         = 17
        
        backgroundColor         = .secondarySystemBackground
        autocorrectionType      = .no
        returnKeyType           = .go
        clearButtonMode         = .whileEditing
        placeholder             = " Enter Password"
        
    }

}

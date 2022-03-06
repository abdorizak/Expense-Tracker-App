//
//  CustomTextFields.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/5/22.
//

import UIKit

class CustomTextFields: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configpass()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init (textContentType: UITextContentType, isSecureTextEntry: Bool, placeholder: String?) {
        self.init(frame: .zero)
        self.textContentType = textContentType
        self.isSecureTextEntry = isSecureTextEntry
        self.placeholder        = placeholder
        
    }
    
    func configpass() {
        translatesAutoresizingMaskIntoConstraints = false        
        layer.cornerRadius      = 5
        
        textColor               = .label
        tintColor               = .label
        
        textAlignment           = .left
        font                    = UIFont.systemFont(ofSize: 17)
        minimumFontSize         = 17
        
        backgroundColor         = .secondarySystemBackground
        autocorrectionType      = .no
        returnKeyType           = .go
        clearButtonMode         = .whileEditing
    }

}

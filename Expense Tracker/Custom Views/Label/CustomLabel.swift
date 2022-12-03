//
//  ETLabel.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/1/22.
//
// UI DESING

import UIKit

class CustomLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configlbl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat , textWeight: UIFont.Weight) {
        self.init(frame: .zero)
        self.textAlignment      = textAlignment
        self.font               = UIFont.systemFont(ofSize: fontSize, weight: textWeight)
    }
    
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat , textWeight: UIFont.Weight, text: String?) {
        self.init(frame: .zero)
        self.textAlignment      = textAlignment
        self.font               = UIFont.systemFont(ofSize: fontSize, weight: textWeight)
        self.text               = text
    }
    
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font           = UIFont(name: "Helvetica Neue", size: fontSize)
    }
    
    private func configlbl(){
        translatesAutoresizingMaskIntoConstraints = false
        textColor                   = .label
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.9
        lineBreakMode               = .byTruncatingTail
    }

}


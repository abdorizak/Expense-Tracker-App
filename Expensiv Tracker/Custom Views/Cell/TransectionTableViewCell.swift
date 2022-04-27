//
//  TransectionTableViewCell.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 4/24/22.
//

import UIKit

class TransectionTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: TransectionTableViewCell.self)
    
    let titleLabel = CustomLabel(textAlignment: .left, fontSize: 20, textWeight: .heavy, text: "Hayaat Market")
    let descriptionLabel = CustomLabel(textAlignment: .left, fontSize: 18, textWeight: .heavy, text: "Waxaa soo Gatay 3 Shaati")
    let AmountLabel = CustomLabel(textAlignment: .left, fontSize: 18, textWeight: .heavy, text: "$200")
    let dateLabel = CustomLabel(textAlignment: .left, fontSize: 18, textWeight: .heavy, text: "04/04/2022")
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config() {
        contentView.addSubViews(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20)
        ])
        
    }
    
}

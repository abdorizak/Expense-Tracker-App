//
//  TransectionTableViewCell.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 4/24/22.
//

import UIKit

class TransectionTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: TransectionTableViewCell.self)
    
    let cardView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.cornerRadius = 15
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 10
        return view
    }()
    let iconImage = AvatarImageView(frame: .zero)
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
        iconImage.image = Images.spending_Money
        iconImage.layer.cornerRadius = iconImage.frame.width / 2
        contentView.addSubview(cardView)
        
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            
            

        ])
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
         let bottomSpace: CGFloat = 10.0
         contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: bottomSpace, right: 0))
    }
    
}

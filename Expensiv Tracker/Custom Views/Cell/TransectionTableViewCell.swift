//
//  TransectionTableViewCell.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 4/24/22.
//
// UI DESING

import UIKit

class TransectionTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: TransectionTableViewCell.self)
    
    let titleLabel = CustomLabel(textAlignment: .left, fontSize: 22, textWeight: .semibold, text: "Hayaat Market")
    let descriptionLabel = CustomLabel(textAlignment: .left, fontSize: 14, textWeight: .thin, text: "Waxaa soo Gatay 3 Shaati Anigoo iska maraayo taleex aa arkay suuqa xayaat. Waxaa soo Gatay 3 Shaati Anigoo iska maraayo taleex aa arkay suuqa xayaat")
    let typeTransectionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "67ff63")
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.cornerRadius = 12
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 5
        return view
    }()
    let typeTransection  = CustomLabel(textAlignment: .center, fontSize: 12, textWeight: .semibold, text: "Expense")
    let AmountLabel = CustomLabel(textAlignment: .right, fontSize: 34, textWeight: .semibold)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config() {
        typeTransectionView.addSubview(typeTransection)
        typeTransection.textColor = .black
        descriptionLabel.adjustsFontForContentSizeCategory   = true
        descriptionLabel.adjustsFontSizeToFitWidth           = true
        descriptionLabel.numberOfLines                       = 2
        descriptionLabel.minimumScaleFactor                  = 0.75
        descriptionLabel.lineBreakMode                       = .byTruncatingTail
        contentView.addSubViews(titleLabel, typeTransectionView, descriptionLabel, AmountLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            typeTransectionView.centerYAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 8),
            typeTransectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            typeTransectionView.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 4),
            typeTransectionView.heightAnchor.constraint(equalToConstant: 25),
            typeTransectionView.widthAnchor.constraint(equalToConstant: 60),
            
            typeTransection.topAnchor.constraint(equalTo: typeTransectionView.topAnchor),
            typeTransection.trailingAnchor.constraint(equalTo: typeTransectionView.trailingAnchor),
            typeTransection.leadingAnchor.constraint(equalTo: typeTransectionView.leadingAnchor),
            typeTransection.bottomAnchor.constraint(equalTo: typeTransectionView.bottomAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 35),
            descriptionLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            
            AmountLabel.topAnchor.constraint(equalTo: typeTransectionView.bottomAnchor, constant: 8),
            AmountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            AmountLabel.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 90),
            AmountLabel.heightAnchor.constraint(equalToConstant: 38)
            
            
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bottomSpace: CGFloat = 10.0
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: bottomSpace, right: 0))
    }
    
    func display(_ transection: Transections) {
        titleLabel.text = transection.title
        descriptionLabel.text = transection.description
        let ammount = String(transection.ammount)
        AmountLabel.attributedText =  makeFormattedBalance(dollar: ammount)
        if transection.type == "Expense" {
            typeTransection.text = transection.type
            typeTransectionView.backgroundColor = UIColor(hex: "ff2c2c")
        } else if transection.type == "Income" {
            typeTransection.text = transection.type
            typeTransectionView.backgroundColor = UIColor(hex: "67ff63")
        }
    }
    
}

extension TransectionTableViewCell: BalanceFormater {
    
    func makeFormattedBalance(dollar dollars: String) -> NSMutableAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        
        rootString.append(dollarString)
        
        return rootString
    }
    
}

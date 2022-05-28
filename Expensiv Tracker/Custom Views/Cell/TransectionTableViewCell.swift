//
//  TransectionTableViewCell.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 4/24/22.
//

import UIKit

class TransectionTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: TransectionTableViewCell.self)
    
//    let income_expenseView: UIView = {
//        let view = UIView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = UIColor(hex: "E5E5DE")
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowOffset = .zero
//        view.layer.cornerRadius = 15
//        view.layer.shadowOpacity = 0.1
//        view.layer.shadowRadius = 10
//        return view
//    }()
    let titleLabel = CustomLabel(textAlignment: .left, fontSize: 22, textWeight: .semibold, text: "Hayaat Market")
    let descriptionLabel = CustomLabel(textAlignment: .left, fontSize: 14, textWeight: .regular, text: "Waxaa soo Gatay 3 Shaati Anigoo iska maraayo taleex aa arkay suuqa xayaat. Waxaa soo Gatay 3 Shaati Anigoo iska maraayo taleex aa arkay suuqa xayaat")
    let typeTransectionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        41E64A
        view.backgroundColor = UIColor(hex: "67ff63")
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.cornerRadius = 12
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 5
        return view
    }()
    let typeTransection  = CustomLabel(textAlignment: .center, fontSize: 12, textWeight: .semibold, text: "Expense")
    let AmountLabel = CustomLabel(textAlignment: .left, fontSize: 32, textWeight: .semibold)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config() {
//        5af857 E5E5DE
//        contentView.backgroundColor = UIColor(hex: "E5E5DE")
        typeTransectionView.addSubview(typeTransection)
        typeTransection.textColor = .black
        descriptionLabel.adjustsFontForContentSizeCategory   = true
        descriptionLabel.adjustsFontSizeToFitWidth           = true
        descriptionLabel.numberOfLines                       = 2
        descriptionLabel.minimumScaleFactor                  = 0.75
        descriptionLabel.lineBreakMode                       = .byTruncatingMiddle
        AmountLabel.attributedText = makeFormattedBalance(dollars: "2,034", cents: "43")
        contentView.addSubViews(titleLabel, typeTransectionView, descriptionLabel, AmountLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
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
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 16),
            
            AmountLabel.topAnchor.constraint(equalTo: typeTransectionView.bottomAnchor, constant: 8),
            AmountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            AmountLabel.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: descriptionLabel.trailingAnchor, multiplier: 4),
            AmountLabel.heightAnchor.constraint(equalToConstant: 34)
            
            
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bottomSpace: CGFloat = 10.0
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: bottomSpace, right: 0))
    }
    
}

extension TransectionTableViewCell {
    func makeFormattedBalance(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
    }
}

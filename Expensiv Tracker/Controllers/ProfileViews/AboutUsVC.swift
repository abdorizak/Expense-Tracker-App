//
//  AboutUsVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 6/8/22.
//

import UIKit

class AboutUsVC: UIViewController {
    
    private let expense_Img  = AvatarImageView(frame: .zero)
    private let expense_Label = CustomLabel(textAlignment: .center, fontSize: 38, textWeight: .bold)
    
    private let expense_description: UITextView = {
        let textView = UITextView()
        let attributeText = NSMutableAttributedString(string: "Expense Tracker App", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 36), NSAttributedString.Key.foregroundColor: UIColor.label])
        attributeText.append(NSAttributedString(string: "\n\n An expense is the cost of operations that a company incurs to generate revenue. As the popular saying goes, “it costs money to make money.Common expenses include payments to suppliers, employee wages, factory leases, and equipment depreciation. Businesses are allowed to write off tax-deductible expenses on their income tax returns to lower their taxable income and thus their tax liability. However, the Internal Revenue Service (IRS) has strict rules on which expenses businesses are allowed to claim as a deduction.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray]))
        textView.attributedText = attributeText
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configAboutUS()
    }
    
    private func configAboutUS() {
        view.addSubViews(expense_Img, expense_description)
        expense_Img.image = Images.aboutUS_ExpenseImage
        expense_Img.contentMode = .scaleAspectFill
        NSLayoutConstraint.activate([
            expense_Img.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            expense_Img.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            expense_Img.heightAnchor.constraint(equalToConstant: 300),
            expense_Img.widthAnchor.constraint(equalToConstant: 300),
            
            expense_description.topAnchor.constraint(equalTo: expense_Img.bottomAnchor, constant: 30),
            expense_description.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            expense_description.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            expense_description.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 30),
            
            
            
        ])
    }

    
    

}

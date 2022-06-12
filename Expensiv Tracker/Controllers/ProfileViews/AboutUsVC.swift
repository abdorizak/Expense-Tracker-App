//
//  AboutUsVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 6/8/22.
//

import UIKit

class AboutUsVC: UIViewController {
    
    private let expense_Img  = AvatarImageView(frame: .zero)
    private let expense_Label = CustomLabel(textAlignment: .center, fontSize: 35, textWeight: .bold)
    
    private let expense_body: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.allowsEditingTextAttributes = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configAboutUS()
    }
    
    private func configAboutUS() {
        view.addSubViews(expense_Img, expense_Label)
        expense_Img.image = Images.aboutUS_ExpenseImage
        expense_Img.contentMode = .scaleAspectFill
        NSLayoutConstraint.activate([
            expense_Img.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            expense_Img.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            expense_Img.heightAnchor.constraint(equalToConstant: 300),
            expense_Img.widthAnchor.constraint(equalToConstant: 300)
            
        ])
    }

    
    

}

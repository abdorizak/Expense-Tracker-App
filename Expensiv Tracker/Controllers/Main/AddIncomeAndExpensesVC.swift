//
//  AddExpensesVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/3/22.
//

import UIKit

class AddIncomeAndExpensesVC: UIViewController {
    
    // MARK: Label
    private let EIlabel = CustomLabel(textAlignment: .center, fontSize: 22, textWeight: .medium, text: "Add Income or Expenses")
    
    // MARK: UIView
    private let txtfeildView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor        = .tertiarySystemFill
        view.layer.shadowColor      = UIColor.black.cgColor
        view.layer.shadowOffset     = .zero
        view.layer.cornerRadius     = 30
        view.layer.shadowOpacity    = 0.1
        view.layer.shadowRadius     = 5
        return view
    }()
    
    // MARK: TextFeild
    private let expensesAndIncomeTextField: UITextField = {
        let textFeild = UITextField(frame: .zero)
        textFeild.borderStyle = .none
        textFeild.clearsOnBeginEditing = true
        textFeild.textAlignment = .center
        textFeild.text = "$0"
        textFeild.keyboardType = .numberPad
        textFeild.font = UIFont.systemFont(ofSize: 40)
        textFeild.translatesAutoresizingMaskIntoConstraints = false
        return textFeild
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddVC()
        expensesAndIncomeTextfeilds()
    }
    
    private func configureAddVC() {
        view.backgroundColor = .systemBackground
        view.addSubViews(EIlabel, txtfeildView)
    }
    
    
    private func expensesAndIncomeTextfeilds() {
        EIlabel.textColor = .tertiaryLabel
        txtfeildView.addSubview(expensesAndIncomeTextField)
        
        NSLayoutConstraint.activate([
            EIlabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            EIlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            EIlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            EIlabel.heightAnchor.constraint(equalToConstant: 24),
            
            
            txtfeildView.topAnchor.constraint(equalTo: EIlabel.bottomAnchor, constant: 30),
            txtfeildView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            txtfeildView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            txtfeildView.heightAnchor.constraint(equalToConstant: 80),
            
            expensesAndIncomeTextField.topAnchor.constraint(equalTo: txtfeildView.topAnchor),
            expensesAndIncomeTextField.trailingAnchor.constraint(equalTo: txtfeildView.trailingAnchor),
            expensesAndIncomeTextField.leadingAnchor.constraint(equalTo: txtfeildView.leadingAnchor),
            expensesAndIncomeTextField.heightAnchor.constraint(equalToConstant: 80)
        ])
    }


}

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
    private let ItemViewOne = CustomView(frame: .zero)
    private let itemViewTwo = CustomView(frame: .zero)
    
    // MARK: TextField
    private let expensesAndIncomeTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.borderStyle = .none
        textField.clearsOnBeginEditing = true
        textField.textAlignment = .center
        textField.text = "$0"
        textField.keyboardType = .numberPad
        textField.font = UIFont.systemFont(ofSize: 40)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let categoryTextField: UITextField = {
        let category = UITextField(frame: .zero)
        category.borderStyle = .none
        category.clearsOnBeginEditing = true
        category.textAlignment = .center
        category.placeholder = "Category"
        category.keyboardType = .numberPad
        category.font = UIFont.systemFont(ofSize: 40)
        category.translatesAutoresizingMaskIntoConstraints = false
        return category
    }()
    
    private let titleTextField: UITextField = {
        let title = UITextField(frame: .zero)
        title.borderStyle = .none
        title.clearsOnBeginEditing = true
        title.textAlignment = .center
        title.placeholder = "Title"
        title.keyboardType = .numberPad
        title.font = UIFont.systemFont(ofSize: 40)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let descriptionTextField: UITextField = {
        let description = UITextField(frame: .zero)
        description.borderStyle = .none
        description.clearsOnBeginEditing = true
        description.textAlignment = .center
        description.placeholder = "Description"
        description.keyboardType = .numberPad
        description.font = UIFont.systemFont(ofSize: 40)
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private let dateTextField: UITextField = {
        let date = UITextField(frame: .zero)
        date.borderStyle = .none
        date.clearsOnBeginEditing = true
        date.textAlignment = .center
        date.placeholder = "Category"
        date.keyboardType = .numberPad
        date.font = UIFont.systemFont(ofSize: 40)
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddVC()
        expensesAndIncomeTextfields()
    }
    
    private func configureAddVC() {
        view.backgroundColor = .systemBackground
        view.addSubViews(EIlabel, ItemViewOne)
    }
    
    
    private func expensesAndIncomeTextfields() {
        EIlabel.textColor = .tertiaryLabel
        ItemViewOne.addSubview(expensesAndIncomeTextField)
        
        NSLayoutConstraint.activate([
            EIlabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            EIlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            EIlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            EIlabel.heightAnchor.constraint(equalToConstant: 24),
            
            
            ItemViewOne.topAnchor.constraint(equalTo: EIlabel.bottomAnchor, constant: 30),
            ItemViewOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            ItemViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            ItemViewOne.heightAnchor.constraint(equalToConstant: 80),
            
            expensesAndIncomeTextField.topAnchor.constraint(equalTo: ItemViewOne.topAnchor),
            expensesAndIncomeTextField.trailingAnchor.constraint(equalTo: ItemViewOne.trailingAnchor),
            expensesAndIncomeTextField.leadingAnchor.constraint(equalTo: ItemViewOne.leadingAnchor),
            expensesAndIncomeTextField.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    
    private func configFrom() {
        // MARK: CategoryTextFeild, TitleTExtField, DescriptionTextFeild, DateTextFeild, SaveButton
        
    }
        

}

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
    private let itemView1 = CustomView(frame: .zero)
    private let itemView2 = CustomView(frame: .zero)
    private let itemView3 = CustomView(frame: .zero)
    private let itemView4 = CustomView(frame: .zero)
    private let itemView5 = CustomView(frame: .zero)
    
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
        
        category.font = UIFont.systemFont(ofSize: 20)
        category.translatesAutoresizingMaskIntoConstraints = false
        return category
    }()
    
    private let titleTextField: UITextField = {
        let title = UITextField(frame: .zero)
        title.borderStyle = .none
        title.clearsOnBeginEditing = true
        title.textAlignment = .center
        title.placeholder = "Title"
        title.font = UIFont.systemFont(ofSize: 20)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let descriptionTextField: UITextField = {
        let description = UITextField(frame: .zero)
        description.borderStyle = .none
        description.clearsOnBeginEditing = true
        description.textAlignment = .center
        description.placeholder = "Description"
        description.font = UIFont.systemFont(ofSize: 20)
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private let dateTextField: UITextField = {
        let date = UITextField(frame: .zero)
        date.borderStyle = .none
        date.clearsOnBeginEditing = true
        date.textAlignment = .center
        date.placeholder = "Date"
        date.font = UIFont.systemFont(ofSize: 20)
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    private let SaveButton = GradientButton(frame: .zero)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddVC()
        expensesAndIncomeTextfields()
        configFrom()
    }
    
    private func configureAddVC() {
        view.backgroundColor = .systemBackground
        view.addSubViews(EIlabel, itemView1, itemView2, itemView3, itemView4, itemView5, SaveButton)
    }
    
    
    private func expensesAndIncomeTextfields() {
        EIlabel.textColor = .tertiaryLabel
        itemView1.addSubview(expensesAndIncomeTextField)
        
        NSLayoutConstraint.activate([
            EIlabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            EIlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            EIlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            EIlabel.heightAnchor.constraint(equalToConstant: 24),
            
            
            itemView1.topAnchor.constraint(equalTo: EIlabel.bottomAnchor, constant: 30),
            itemView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            itemView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            itemView1.heightAnchor.constraint(equalToConstant: 80),
            
            expensesAndIncomeTextField.topAnchor.constraint(equalTo: itemView1.topAnchor),
            expensesAndIncomeTextField.trailingAnchor.constraint(equalTo: itemView1.trailingAnchor),
            expensesAndIncomeTextField.leadingAnchor.constraint(equalTo: itemView1.leadingAnchor),
            expensesAndIncomeTextField.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    
    private func configFrom() {
        // MARK: CategoryTextFeild, TitleTExtField, DescriptionTextFeild, DateTextFeild, SaveButton
        // Overriding CornerRadius
        itemView2.layer.cornerRadius = 15
        itemView3.layer.cornerRadius = 15
        itemView4.layer.cornerRadius = 15
        itemView5.layer.cornerRadius = 15
        
        // Adding Views in TextFeilds
        itemView2.addSubview(categoryTextField)
        itemView3.addSubview(titleTextField)
        itemView4.addSubview(descriptionTextField)
        itemView5.addSubview(dateTextField)
        
        // btn
        SaveButton.setTitle("Save", for: .normal)
        
        
        NSLayoutConstraint.activate([
            itemView2.topAnchor.constraint(equalTo: itemView1.bottomAnchor, constant: 30),
            itemView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            itemView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            itemView2.heightAnchor.constraint(equalToConstant: 60),
            
            itemView3.topAnchor.constraint(equalTo: itemView2.bottomAnchor, constant: 30),
            itemView3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            itemView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            itemView3.heightAnchor.constraint(equalToConstant: 60),
            
            itemView4.topAnchor.constraint(equalTo: itemView3.bottomAnchor, constant: 30),
            itemView4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            itemView4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            itemView4.heightAnchor.constraint(equalToConstant: 60),
            
            itemView5.topAnchor.constraint(equalTo: itemView4.bottomAnchor, constant: 30),
            itemView5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            itemView5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            itemView5.heightAnchor.constraint(equalToConstant: 60),
            
            categoryTextField.topAnchor.constraint(equalTo: itemView2.topAnchor),
            categoryTextField.trailingAnchor.constraint(equalTo: itemView2.trailingAnchor),
            categoryTextField.leadingAnchor.constraint(equalTo: itemView2.leadingAnchor),
            categoryTextField.heightAnchor.constraint(equalToConstant: 60),
            
            titleTextField.topAnchor.constraint(equalTo: itemView3.topAnchor),
            titleTextField.trailingAnchor.constraint(equalTo: itemView3.trailingAnchor),
            titleTextField.leadingAnchor.constraint(equalTo: itemView3.leadingAnchor),
            titleTextField.heightAnchor.constraint(equalToConstant: 60),
            
            descriptionTextField.topAnchor.constraint(equalTo: itemView4.topAnchor),
            descriptionTextField.trailingAnchor.constraint(equalTo: itemView4.trailingAnchor),
            descriptionTextField.leadingAnchor.constraint(equalTo: itemView4.leadingAnchor),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 60),
            
            dateTextField.topAnchor.constraint(equalTo: itemView5.topAnchor),
            dateTextField.trailingAnchor.constraint(equalTo: itemView5.trailingAnchor),
            dateTextField.leadingAnchor.constraint(equalTo: itemView5.leadingAnchor),
            dateTextField.heightAnchor.constraint(equalToConstant: 60),
            
            SaveButton.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 80),
            SaveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            SaveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            SaveButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
        

}

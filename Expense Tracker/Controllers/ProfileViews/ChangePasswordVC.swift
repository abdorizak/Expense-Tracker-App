//
//  ChangePasswordVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 4/19/22.
//
// UI DESING

import UIKit

class ChangePasswordVC: UIViewController {
    
    private let currentPasswordLabel        = CustomLabel(textAlignment: .left, fontSize: 14, textWeight: .regular, text: "Current Password")
    private let newPasswordLable            = CustomLabel(textAlignment: .left, fontSize: 14, textWeight: .regular, text: "New Password")
    private let confirmPasswordLable        = CustomLabel(textAlignment: .left, fontSize: 14, textWeight: .regular, text: "Confirm Password")
    
    private let currentPasswordView     = UIView()
    private let newPasswordView         = UIView()
    private let configrmPasswordView    = UIView()
    
    private let currentPassword = UITextField()
    private let newdPassword = UITextField()
    private let confirmPassword = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configViewsAndTextFields()
    }
    
    
    
    func configViewsAndTextFields() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        view.addSubViews(currentPasswordLabel, newPasswordLable, confirmPasswordLable)
        //MARK: - Views
        [currentPasswordView, newPasswordView, configrmPasswordView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = UIColor(hex: "f0f3fd")
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 12
            $0.layer.borderColor = UIColor(hex: "e9e9e9").cgColor
            $0.layer.borderWidth = 1
        }
        
        // MARK: - TextFeilds
        [currentPassword, newdPassword, confirmPassword].forEach { textField in
            textField.textColor               = .label
            textField.tintColor               = .label
            textField.textContentType = .password
            textField.isSecureTextEntry = true
            textField.borderStyle = .none
            textField.clearsOnBeginEditing = true
            textField.textAlignment = .left
            textField.placeholder = "••••••••••"
            textField.autocorrectionType      = .no
            textField.minimumFontSize = 17
            textField.translatesAutoresizingMaskIntoConstraints = false
        }
        currentPasswordView.addSubview(currentPassword)
        newPasswordView.addSubview(newdPassword)
        configrmPasswordView.addSubview(confirmPassword)
        
        NSLayoutConstraint.activate([
            
            // MARK: - Labels
            currentPasswordLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            currentPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            currentPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            newPasswordLable.topAnchor.constraint(equalTo: currentPasswordView.bottomAnchor, constant: 20),
            newPasswordLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            newPasswordLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            confirmPasswordLable.topAnchor.constraint(equalTo: newPasswordView.bottomAnchor, constant: 20),
            confirmPasswordLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            confirmPasswordLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // MARK: - Views
            currentPasswordView.topAnchor.constraint(equalTo: currentPasswordLabel.bottomAnchor, constant: 8),
            currentPasswordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            currentPasswordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            currentPasswordView.heightAnchor.constraint(equalToConstant: 60),
            
            newPasswordView.topAnchor.constraint(equalTo: newPasswordLable.bottomAnchor, constant: 8),
            newPasswordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            newPasswordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            newPasswordView.heightAnchor.constraint(equalToConstant: 60),
            
            configrmPasswordView.topAnchor.constraint(equalTo: confirmPasswordLable.bottomAnchor, constant: 8),
            configrmPasswordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            configrmPasswordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            configrmPasswordView.heightAnchor.constraint(equalToConstant: 60),
            
            
            currentPassword.topAnchor.constraint(equalTo: currentPasswordView.topAnchor, constant: 10),
            currentPassword.trailingAnchor.constraint(equalTo: currentPasswordView.trailingAnchor, constant: -10),
            currentPassword.leadingAnchor.constraint(equalTo: currentPasswordView.leadingAnchor, constant: 10),
            currentPassword.heightAnchor.constraint(equalToConstant: 40),
            
            newdPassword.topAnchor.constraint(equalTo: newPasswordView.topAnchor, constant: 10),
            newdPassword.trailingAnchor.constraint(equalTo: newPasswordView.trailingAnchor, constant: -10),
            newdPassword.leadingAnchor.constraint(equalTo: newPasswordView.leadingAnchor, constant: 10),
            newdPassword.heightAnchor.constraint(equalToConstant: 40),
            
            confirmPassword.topAnchor.constraint(equalTo: configrmPasswordView.topAnchor, constant: 10),
            confirmPassword.trailingAnchor.constraint(equalTo: configrmPasswordView.trailingAnchor, constant: -10),
            confirmPassword.leadingAnchor.constraint(equalTo: configrmPasswordView.leadingAnchor, constant: 10),
            confirmPassword.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    @objc func didTapSave() {
        // this will check first current password the will change password by checking password
        
    }
}

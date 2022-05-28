//
//  EditProfileVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 4/19/22.
//

import UIKit

class EditProfileVC: UIViewController {
    
    // MARK: - Scroller View
    let scrollView          = UIScrollView()
    let contentView         = UIView()
    
    // MARK: - Image
    let avaterImage       = AvatarImageView(frame: .zero)
    
    // MARK: - Labels
    let fullnameLable = CustomLabel(textAlignment: .left, fontSize: 14, textWeight: .regular, text: "Full Name")
    let emailLabel    = CustomLabel(textAlignment: .left, fontSize: 14, textWeight: .regular, text: "Email")
    let phoneLabel    = CustomLabel(textAlignment: .left, fontSize: 14, textWeight: .regular, text: "Phone")
    let usernameLabel = CustomLabel(textAlignment: .left, fontSize: 14, textWeight: .regular, text: "Username")
    let genderLabel   = CustomLabel(textAlignment: .left, fontSize: 14, textWeight: .regular, text: "Gender")
    
    // MARK: - Views
    let fullnameView            = UIView()
    let emailView               = UIView()
    let phoneView               = UIView()
    let usernameview            = UIView()
    let genderView              = UIView()
    var itemviews: [UIView]     = []
    
    // MARK: - Text
    let fullnameTextfeild = CustomTextFields(textContentType: .name, placeholder: "Full Name")
    let emailTextfeild    = CustomTextFields(textContentType: .emailAddress, placeholder: "Email")
    let phoneTextfeild    = CustomTextFields(placeholder: "Phone")
    let usernameTextfeild = CustomTextFields(textContentType: .username, placeholder: "Username")
    let genderType:[String] = ["Male", "Female"]
    let genderTextfeild     = CustomTextFields(placeholder: "Gender")
    
    lazy var genderTypePicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configEditProfileVC()
        
    }
    
    func configEditProfileVC() {
        view.backgroundColor = .systemBackground
        ConfigureScrollView()
        configImage()
        genderTextfeild.inputView = genderTypePicker
        configLabelsWithViews()
       
    }
    
    func ConfigureScrollView() {
            view.addSubview(scrollView)
            scrollView.addSubview(contentView)
            scrollView.pinToEdges(to: view)
            contentView.pinToEdges(to: scrollView)
            
            NSLayoutConstraint.activate([
                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                contentView.heightAnchor.constraint(equalToConstant: 600)
            ])
        }
    
    func configImage() {
        avaterImage.contentMode = .scaleAspectFit
        avaterImage.layer.cornerRadius = 12
        avaterImage.layer.shadowColor = UIColor.black.cgColor
        avaterImage.layer.shadowOffset = .zero
        avaterImage.layer.shadowRadius = 12
        avaterImage.layer.shadowOpacity = 0.3
        
        contentView.addSubview(avaterImage)
        NSLayoutConstraint.activate([
            avaterImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            avaterImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            avaterImage.heightAnchor.constraint(equalToConstant: 120),
            avaterImage.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    func configLabelsWithViews() {
        contentView.addSubViews(fullnameLable, emailLabel, phoneLabel, usernameLabel, genderLabel)
        [fullnameView, emailView, phoneView, usernameview, genderView].forEach { view in
            contentView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor(hex: "f0f3fd")
            view.clipsToBounds = true
            view.layer.cornerRadius = 12
            view.layer.borderColor = UIColor(hex: "e9e9e9").cgColor
            view.layer.borderWidth = 1
        }
        
        fullnameView.addSubview(fullnameTextfeild)
        emailView.addSubview(emailTextfeild)
        phoneView.addSubview(phoneTextfeild)
        usernameview.addSubview(usernameTextfeild)
        genderView.addSubview(genderTextfeild)
        
        
        NSLayoutConstraint.activate([
            
            //MARK: - View Constraints
            fullnameLable.topAnchor.constraint(equalTo: avaterImage.bottomAnchor, constant: 30),
            fullnameLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            fullnameLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            fullnameView.topAnchor.constraint(equalToSystemSpacingBelow: fullnameLable.bottomAnchor, multiplier: 1),
            fullnameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            fullnameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            fullnameView.heightAnchor.constraint(equalToConstant: 60),
            
            emailLabel.topAnchor.constraint(equalToSystemSpacingBelow: fullnameView.bottomAnchor, multiplier: 2),
            emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            emailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            emailView.topAnchor.constraint(equalToSystemSpacingBelow: emailLabel.bottomAnchor, multiplier: 1),
            emailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            emailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            emailView.heightAnchor.constraint(equalToConstant: 60),
            
            phoneLabel.topAnchor.constraint(equalToSystemSpacingBelow: emailView.bottomAnchor, multiplier: 2),
            phoneLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            phoneLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            phoneView.topAnchor.constraint(equalToSystemSpacingBelow: phoneLabel.bottomAnchor, multiplier: 1),
            phoneView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            phoneView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            phoneView.heightAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.topAnchor.constraint(equalToSystemSpacingBelow: phoneView.bottomAnchor, multiplier: 2),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            usernameview.topAnchor.constraint(equalToSystemSpacingBelow: usernameLabel.bottomAnchor, multiplier: 1),
            usernameview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            usernameview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            usernameview.heightAnchor.constraint(equalToConstant: 60),
            
            genderLabel.topAnchor.constraint(equalToSystemSpacingBelow: usernameview.bottomAnchor, multiplier: 2),
            genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            genderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            genderView.topAnchor.constraint(equalToSystemSpacingBelow: genderLabel.bottomAnchor, multiplier: 1),
            genderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            genderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            genderView.heightAnchor.constraint(equalToConstant: 60),
            
            // MARK: - Textfeidls
            fullnameTextfeild.topAnchor.constraint(equalTo: fullnameView.topAnchor),
            fullnameTextfeild.trailingAnchor.constraint(equalTo: fullnameView.trailingAnchor, constant: -10),
            fullnameTextfeild.leadingAnchor.constraint(equalTo: fullnameView.leadingAnchor, constant: 10),
            fullnameTextfeild.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextfeild.topAnchor.constraint(equalTo: emailView.topAnchor),
            emailTextfeild.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -10),
            emailTextfeild.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 10),
            emailTextfeild.heightAnchor.constraint(equalToConstant: 50),
            
            phoneTextfeild.topAnchor.constraint(equalTo: phoneView.topAnchor),
            phoneTextfeild.trailingAnchor.constraint(equalTo: phoneView.trailingAnchor, constant: -10),
            phoneTextfeild.leadingAnchor.constraint(equalTo: phoneView.leadingAnchor, constant: 10),
            phoneTextfeild.heightAnchor.constraint(equalToConstant: 50),
            
            usernameTextfeild.topAnchor.constraint(equalTo: usernameview.topAnchor),
            usernameTextfeild.trailingAnchor.constraint(equalTo: usernameview.trailingAnchor, constant: -10),
            usernameTextfeild.leadingAnchor.constraint(equalTo: usernameview.leadingAnchor, constant: 10),
            usernameTextfeild.heightAnchor.constraint(equalToConstant: 50),
            
            genderTextfeild.topAnchor.constraint(equalTo: genderView.topAnchor),
            genderTextfeild.trailingAnchor.constraint(equalTo: genderView.trailingAnchor, constant: -10),
            genderTextfeild.leadingAnchor.constraint(equalTo: genderView.leadingAnchor, constant: 10),
            genderTextfeild.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
    }
    
    
}


extension EditProfileVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        genderType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        genderType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextfeild.text = genderType[row]
        genderTextfeild.resignFirstResponder()
    }
    
}

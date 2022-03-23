//
//  SingUpVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/1/22.
//

import UIKit

class SingUpVC: UIViewController {
    
    // MARK: - ScrollView And UIViews
    private let scrollView          = UIScrollView()
    private let ContentView         = UIView()
    private let signUpView          = UIView()
    
    // MARK: - UIImageView
    private let signUPImage: UIImageView = {
        let image = UIImageView()
        image.image = Images.singup_Image
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // MARK: - TextFeilds and Buttons , Label's
    private let signUplabel         = CustomLabel(textAlignment: .left, fontSize: 38, textWeight: .bold, text: "Sign Up")
    
    private let signUpBtn           = EButton(backgroundColor: .systemBlue, title: "Sign up", TextStyle: .title3)
    
    private let fullnameTextFeild            = CustomTextFields(textContentType: .name, isSecureTextEntry: false, placeholder: "Full name")
    private let emailTextFeild               = CustomTextFields(textContentType: .emailAddress, isSecureTextEntry: false, placeholder: "Email")
    private let phoneTextFeild               = CustomTextFields(textContentType: .telephoneNumber, isSecureTextEntry: false, placeholder: "Mobile")
    private let usernameTextFeild            = CustomTextFields(textContentType: .username, isSecureTextEntry: false, placeholder: "Username")
    private let passwordTextFeild            = CustomTextFields(textContentType: .newPassword, isSecureTextEntry: true, placeholder: "Password")
    private let confirmPasswordTextFeild     = CustomTextFields(textContentType: .newPassword, isSecureTextEntry: true, placeholder: "Confirm Password")

    var items: [CustomTextFields] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configVC()
        configScrollView()
        configSingUPImage()
        configSignUpFormView()
        configSignUPBtn()
    }
    
    private func configVC() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissVC))
        let tap  = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        ContentView.addSubViews(signUPImage, signUplabel, signUpView, signUpBtn)
    }
    
    private func configScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(ContentView)
        scrollView.pinToEdges(to: view)
        ContentView.pinToEdges(to: scrollView)
        
        NSLayoutConstraint.activate([
            ContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            ContentView.heightAnchor.constraint(equalToConstant: 900)
        ])
    }
    
    private func configSingUPImage() {
        NSLayoutConstraint.activate([
            signUPImage.topAnchor.constraint(equalTo: ContentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            signUPImage.trailingAnchor.constraint(equalTo: ContentView.trailingAnchor, constant: -20),
            signUPImage.leadingAnchor.constraint(equalTo: ContentView.leadingAnchor, constant: 20),
            signUPImage.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func configSignUpFormView() {
        signUpView.addSubViews(fullnameTextFeild, emailTextFeild, phoneTextFeild, usernameTextFeild, passwordTextFeild, confirmPasswordTextFeild)
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        signUpView.backgroundColor = .secondarySystemBackground
        signUpView.layer.cornerRadius = 15
        
        items = [fullnameTextFeild, emailTextFeild, phoneTextFeild, usernameTextFeild, passwordTextFeild, confirmPasswordTextFeild]
        
        for i in items {
            i.addLine(position: .bottom, color: .label, width: 0.4)
        }
        
        NSLayoutConstraint.activate([
            
            signUplabel.topAnchor.constraint(equalTo: signUPImage.bottomAnchor, constant: 20),
            signUplabel.leadingAnchor.constraint(equalTo: ContentView.leadingAnchor, constant: 20),
            signUplabel.trailingAnchor.constraint(equalTo: ContentView.trailingAnchor, constant: -20),
            signUplabel.heightAnchor.constraint(equalToConstant: 40),
            
            signUpView.topAnchor.constraint(equalTo: signUplabel.bottomAnchor, constant: 20),
            signUpView.trailingAnchor.constraint(equalTo: ContentView.trailingAnchor, constant: -20),
            signUpView.leadingAnchor.constraint(equalTo: ContentView.leadingAnchor, constant: 20),
            signUpView.heightAnchor.constraint(equalToConstant: 400),
            
            
            fullnameTextFeild.topAnchor.constraint(equalTo: signUpView.topAnchor, constant: 15),
            fullnameTextFeild.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            fullnameTextFeild.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            fullnameTextFeild.heightAnchor.constraint(equalToConstant: 45),

            emailTextFeild.topAnchor.constraint(equalTo: fullnameTextFeild.bottomAnchor, constant: 15),
            emailTextFeild.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            emailTextFeild.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            emailTextFeild.heightAnchor.constraint(equalToConstant: 45),

            phoneTextFeild.topAnchor.constraint(equalTo: emailTextFeild.bottomAnchor, constant: 20),
            phoneTextFeild.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            phoneTextFeild.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            phoneTextFeild.heightAnchor.constraint(equalToConstant: 45),

            usernameTextFeild.topAnchor.constraint(equalTo: phoneTextFeild.bottomAnchor, constant: 20),
            usernameTextFeild.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            usernameTextFeild.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            usernameTextFeild.heightAnchor.constraint(equalToConstant: 45),

            passwordTextFeild.topAnchor.constraint(equalTo: usernameTextFeild.bottomAnchor, constant: 20),
            passwordTextFeild.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            passwordTextFeild.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            passwordTextFeild.heightAnchor.constraint(equalToConstant: 45),

            confirmPasswordTextFeild.topAnchor.constraint(equalTo: passwordTextFeild.bottomAnchor, constant: 15),
            confirmPasswordTextFeild.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            confirmPasswordTextFeild.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            confirmPasswordTextFeild.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
    
    private func configSignUPBtn() {
        
        NSLayoutConstraint.activate([
            signUpBtn.topAnchor.constraint(equalTo: signUpView.bottomAnchor, constant: 20),
            signUpBtn.trailingAnchor.constraint(equalTo: ContentView.trailingAnchor, constant: -80),
            signUpBtn.leadingAnchor.constraint(equalTo: ContentView.leadingAnchor, constant: 80),
            signUpBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


//
//  SingUpVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/1/22.
//

import UIKit

class SingUpVC: UIViewController {
    
    private let scrollView          = UIScrollView()
    private let ContentView         = UIView()
    
    private let signUPImage: UIImageView = {
        let image = UIImageView()
        image.image = Images.singup_Image
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let signUpBtn           = EButton(backgroundColor: .systemBlue, title: "Sign up", TextStyle: .title3)
    
    private let fullnameTextFeild            = CustomTextFields(textContentType: .name, isSecureTextEntry: false, placeholder: " Full name")
    private let emailTextFeild               = CustomTextFields(textContentType: .emailAddress, isSecureTextEntry: false, placeholder: " Email")
    private let phoneTextFeild               = CustomTextFields(textContentType: .telephoneNumber, isSecureTextEntry: false, placeholder: " Mobile")
    private let usernameTextFeild            = CustomTextFields(textContentType: .username, isSecureTextEntry: false, placeholder: " Username")
    private let passwordTextFeild            = CustomTextFields(textContentType: .newPassword, isSecureTextEntry: true, placeholder: " Password")
    private let confirmPasswordTextFeild     = CustomTextFields(textContentType: .newPassword, isSecureTextEntry: true, placeholder: " Confirm Password")

    override func viewDidLoad() {
        super.viewDidLoad()
        configVC()
        configScrollView()
        configSingUPImage()
        configformTextFeilds()
        configSignUPBtn()
    }
    
    private func configVC() {
        view.backgroundColor = .systemBackground
        title = "Sing Up"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissVC))
        let tap  = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        ContentView.addSubViews(signUPImage, fullnameTextFeild, emailTextFeild, phoneTextFeild, usernameTextFeild, passwordTextFeild, confirmPasswordTextFeild, signUpBtn)
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
            signUPImage.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    private func configformTextFeilds() {
        
        NSLayoutConstraint.activate([
            fullnameTextFeild.topAnchor.constraint(equalTo: signUPImage.bottomAnchor, constant: 20),
            fullnameTextFeild.trailingAnchor.constraint(equalTo: ContentView.trailingAnchor, constant: -20),
            fullnameTextFeild.leadingAnchor.constraint(equalTo: ContentView.leadingAnchor, constant: 20),
            fullnameTextFeild.heightAnchor.constraint(equalToConstant: 45),
            
            emailTextFeild.topAnchor.constraint(equalTo: fullnameTextFeild.bottomAnchor, constant: 15),
            emailTextFeild.trailingAnchor.constraint(equalTo: ContentView.trailingAnchor, constant: -20),
            emailTextFeild.leadingAnchor.constraint(equalTo: ContentView.leadingAnchor, constant: 20),
            emailTextFeild.heightAnchor.constraint(equalToConstant: 45),
            
            phoneTextFeild.topAnchor.constraint(equalTo: emailTextFeild.bottomAnchor, constant: 15),
            phoneTextFeild.trailingAnchor.constraint(equalTo: ContentView.trailingAnchor, constant: -20),
            phoneTextFeild.leadingAnchor.constraint(equalTo: ContentView.leadingAnchor, constant: 20),
            phoneTextFeild.heightAnchor.constraint(equalToConstant: 45),
            
            usernameTextFeild.topAnchor.constraint(equalTo: phoneTextFeild.bottomAnchor, constant: 15),
            usernameTextFeild.trailingAnchor.constraint(equalTo: ContentView.trailingAnchor, constant: -20),
            usernameTextFeild.leadingAnchor.constraint(equalTo: ContentView.leadingAnchor, constant: 20),
            usernameTextFeild.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTextFeild.topAnchor.constraint(equalTo: usernameTextFeild.bottomAnchor, constant: 15),
            passwordTextFeild.trailingAnchor.constraint(equalTo: ContentView.trailingAnchor, constant: -20),
            passwordTextFeild.leadingAnchor.constraint(equalTo: ContentView.leadingAnchor, constant: 20),
            passwordTextFeild.heightAnchor.constraint(equalToConstant: 45),
            
            confirmPasswordTextFeild.topAnchor.constraint(equalTo: passwordTextFeild.bottomAnchor, constant: 15),
            confirmPasswordTextFeild.trailingAnchor.constraint(equalTo: ContentView.trailingAnchor, constant: -20),
            confirmPasswordTextFeild.leadingAnchor.constraint(equalTo: ContentView.leadingAnchor, constant: 20),
            confirmPasswordTextFeild.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
    
    private func configSignUPBtn() {
        
        NSLayoutConstraint.activate([
            signUpBtn.topAnchor.constraint(equalTo: confirmPasswordTextFeild.bottomAnchor, constant: 20),
            signUpBtn.trailingAnchor.constraint(equalTo: ContentView.trailingAnchor, constant: -20),
            signUpBtn.leadingAnchor.constraint(equalTo: ContentView.leadingAnchor, constant: 20),
            signUpBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


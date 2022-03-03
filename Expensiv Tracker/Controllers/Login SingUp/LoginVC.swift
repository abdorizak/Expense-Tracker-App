//
//  LoginVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/1/22.
//

import UIKit

class LoginVC: UIViewController {
    
    let scrollView          = UIScrollView()
    let contentView         = UIView()
    
    let loginImageView      = UIImageView()
    
    let titleLabel          = ETLabel(textAlignment: .left, fontSize: 40)
    let usernameTextFeild   = UsernameTextField()
    let passwordTextFeild   = PasswordTextField()
    let forgetPassword      = EButton(titleColor: .blue, title: "Forget Password")

    override func viewDidLoad() {
        super.viewDidLoad()
        confgiruVC()
        ConfigureScrollView()
        conigureLoginImage()
        configureLoginLabel()
        configureTextFeilds()
        configforgetBtn()
        createDismissKeyboardTapGesture()
    }
    
    private func confgiruVC() {
        view.backgroundColor = .systemBackground
        contentView.addSubViews(loginImageView, titleLabel, usernameTextFeild, passwordTextFeild, forgetPassword)
        forgetPassword.addTarget(self, action: #selector(pushForgetVC), for: .touchUpInside)
    }
    
    private func createDismissKeyboardTapGesture() {
        let tap  = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func ConfigureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(to: view)
        contentView.pinToEdges(to: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 800)
        ])
    }
    
    private func conigureLoginImage() {
        loginImageView.translatesAutoresizingMaskIntoConstraints = false
        loginImageView.image = Images.login_Image
        
        NSLayoutConstraint.activate([
            loginImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            loginImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            loginImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            loginImageView.heightAnchor.constraint(equalToConstant: 350),
        ])
    }
    
    private func configureLoginLabel() {
        titleLabel.text = "Login"
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: loginImageView.bottomAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    private func configureTextFeilds() {
        
        NSLayoutConstraint.activate([
            usernameTextFeild.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            usernameTextFeild.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            usernameTextFeild.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            usernameTextFeild.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTextFeild.topAnchor.constraint(equalTo: usernameTextFeild.bottomAnchor, constant: 10),
            passwordTextFeild.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            passwordTextFeild.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            passwordTextFeild.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func configforgetBtn() {
        NSLayoutConstraint.activate([
            forgetPassword.topAnchor.constraint(equalTo: passwordTextFeild.bottomAnchor, constant: 25),
            forgetPassword.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            forgetPassword.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 250),
        ])
    }
    
    @objc private func pushForgetVC() {
        let ForgetVC = UINavigationController(rootViewController: ForgetPasswordVC())
        present(ForgetVC, animated: true)
    }

}

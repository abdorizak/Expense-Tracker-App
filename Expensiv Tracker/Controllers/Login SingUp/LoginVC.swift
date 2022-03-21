//
//  LoginVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/1/22.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK: - ScrollView And UIViews
    let scrollView          = UIScrollView()
    let contentView         = UIView()
    let loginFormView        = UIView()
    
    
    // MARK: - UIImageView
    let loginImageView      = UIImageView()
    let usernameIcon        = UIImageView()
    let passwordIcon        = UIImageView()
    
    // MARK: - LOGIN FORM
    let loginglbl          = CustomLabel(textAlignment: .left, fontSize: 40)
    let registeryLabel      = CustomLabel(textAlignment: .left, fontSize: 22)
    let usernameTextFeild   = UsernameTextField(frame: .zero)
    let passwordTextFeild   = PasswordTextField(frame: .zero)
    let forgetPassword      = EButton(titleColor: .link,
                                      title: "Forget Password")
    let loginBtn            = EButton(backgroundColor: .link,
                                      title: "Login",
                                      TextStyle: .headline)
    let singUpbtn           = EButton(titleColor: .link, title: "SingUp Now")
    

    var forgetBtnLeadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confgiruVC()
        ConfigureScrollView()
        conigureLoginImage()
        configureLoginAndRegisteryLabel()
        configureLoginFromView()
        configforgetBtn()
        configLoginAndSingUpBtn()
        createDismissKeyboardTapGesture()
    }
    
    private func confgiruVC() {
        view.backgroundColor = .systemBackground
        contentView.addSubViews(loginImageView, loginglbl, loginFormView, forgetPassword, loginBtn, registeryLabel, singUpbtn)
        forgetPassword.addTarget(self, action: #selector(pushForgetVC), for: .touchUpInside)
        singUpbtn.addTarget(self, action: #selector(pushSingUpVC), for: .touchUpInside)
        navigationController?.setNavigationBarHidden(true, animated: true)
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
        loginImageView.contentMode  = .scaleAspectFit
        loginImageView.translatesAutoresizingMaskIntoConstraints = false
        loginImageView.image = Images.login_Image
        
        
        NSLayoutConstraint.activate([
            loginImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            loginImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            loginImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            loginImageView.heightAnchor.constraint(equalToConstant: 350),
        ])
    }
    
    private func configureLoginAndRegisteryLabel() {
        loginglbl.text = "Login"
        loginglbl.font = .systemFont(ofSize: 40, weight: .bold)
        
        registeryLabel.text = "New Here"
        registeryLabel.font = .systemFont(ofSize: 22, weight: .regular)

        NSLayoutConstraint.activate([
            loginglbl.topAnchor.constraint(equalTo: loginImageView.bottomAnchor, constant: 10),
            loginglbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            loginglbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            loginglbl.heightAnchor.constraint(equalToConstant: 50),
            
            
            registeryLabel.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 40),
            registeryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 130),
            registeryLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    private func configureLoginFromView() {
        
        loginFormView.translatesAutoresizingMaskIntoConstraints = false
        loginFormView.layer.cornerRadius = 10
        loginFormView.backgroundColor = .secondarySystemBackground
        
        loginFormView.addSubViews(usernameIcon, usernameTextFeild, passwordIcon, passwordTextFeild)
        
        NSLayoutConstraint.activate([
            
            loginFormView.topAnchor.constraint(equalTo: loginglbl.bottomAnchor, constant: 10),
            loginFormView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            loginFormView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            loginFormView.heightAnchor.constraint(equalToConstant: 130),
            
//            usernameView.topAnchor.constraint(equalTo: loginglbl.bottomAnchor, constant: 10),
//            usernameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            usernameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            usernameView.heightAnchor.constraint(equalToConstant: 50),
//
//            passwordView.topAnchor.constraint(equalTo: usernameView.bottomAnchor, constant: 10),
//            passwordView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            passwordView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            passwordView.heightAnchor.constraint(equalToConstant: 50),
//
//            usernameTextFeild.topAnchor.constraint(equalTo: usernameView.topAnchor),
//            usernameTextFeild.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
//            usernameTextFeild.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
//            usernameTextFeild.bottomAnchor.constraint(equalTo: usernameView.bottomAnchor),
//            usernameTextFeild.heightAnchor.constraint(equalToConstant: 50),
//
//            passwordTextFeild.topAnchor.constraint(equalTo: passwordView.topAnchor),
//            passwordTextFeild.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -6),
//            passwordTextFeild.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 6),
//            passwordTextFeild.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor),
//            passwordTextFeild.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    private func configforgetBtn() {
        
        let leadingConstraintConstant = CGFloat(DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 250 : 220)
        
        
        NSLayoutConstraint.activate([
            forgetPassword.topAnchor.constraint(equalTo: loginFormView.bottomAnchor, constant: 25),
            forgetPassword.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            forgetPassword.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leadingConstraintConstant),
            
        ])
    }
    
    private func configLoginAndSingUpBtn() {
        
        NSLayoutConstraint.activate([
            loginBtn.topAnchor.constraint(equalTo: forgetPassword.bottomAnchor, constant: 20),
            loginBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            loginBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            loginBtn.heightAnchor.constraint(equalToConstant: 50),
            
            singUpbtn.topAnchor.constraint(equalTo: registeryLabel.bottomAnchor, constant: -22),
            singUpbtn.leadingAnchor.constraint(equalTo: registeryLabel.trailingAnchor, constant: 6),
            singUpbtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
            singUpbtn.heightAnchor.constraint(equalTo: registeryLabel.heightAnchor)
            
        ])
    }
    
    @objc private func pushForgetVC() {
        let ForgetVC = UINavigationController(rootViewController: ForgetPasswordVC())
        present(ForgetVC, animated: true)
    }
    
    @objc private func pushSingUpVC() {
        let singUPVC = UINavigationController(rootViewController: SingUpVC())
        singUPVC.modalPresentationStyle = .fullScreen
        singUPVC.modalTransitionStyle   = .coverVertical
        present(singUPVC, animated: true, completion: nil)
    }

}

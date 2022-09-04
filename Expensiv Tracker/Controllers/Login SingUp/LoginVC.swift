//
//  LoginVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/1/22.
//
// UI DESING

import UIKit

class LoginVC: UIViewController {
    
    // MARK: - ScrollView And UIViews
    let scrollView           = UIScrollView()
    let contentView          = UIView()
    let loginFormView        = UIView()
    
    
    // MARK: - UIImageView
    let loginImageView      = UIImageView()
    let usernameIcon        = UIImageView()
    let passwordIcon        = UIImageView()
    
    // MARK: - LOGIN FORM
    let loginglbl           = CustomLabel(textAlignment: .left, fontSize: 40)
    let registeryLabel      = CustomLabel(textAlignment: .left, fontSize: 22)
    let orLable             = CustomLabel(textAlignment: .center, fontSize: 18, textWeight: .light, text: "Or")
    let usernameTextFeild   = UsernameTextField(frame: .zero)
    let passwordTextFeild   = PasswordTextField(frame: .zero)
    let forgetPassword      = EButton(titleColor: .link,
                                      title: "Forget Password")
    let loginBtn            = EButton(backgroundColor: .link, title: "Login", TextStyle: .headline)
    let loginWithPin            = EButton(backgroundColor: .link, title: "Login With Pin", TextStyle: .headline)
    let signUpbtn           = EButton(titleColor: .link, title: "SignUp Now")

    var forgetBtnLeadingConstraint: NSLayoutConstraint!
    private var loginViewModel = LoginViewModel()
    
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
//        let currentScreen = UIScreen.main.bounds.size.height
//        let currentScreen1 = UIScreen.main.bounds.size.width
//        print(max(currentScreen, currentScreen1))
    }
    
    private func confgiruVC() {
        view.backgroundColor = .systemBackground
        contentView.addSubViews(loginImageView, loginglbl, loginFormView, forgetPassword, loginBtn, loginWithPin, orLable, registeryLabel, signUpbtn)
        forgetPassword.addTarget(self, action: #selector(pushForgetVC), for: .touchUpInside)
        signUpbtn.addTarget(self, action: #selector(pushSingUpVC), for: .touchUpInside)
        loginBtn.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
        loginWithPin.addTarget(self, action: #selector(loginwithPinClicked), for: .touchUpInside)
        navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    
    
    @objc func loginBtnClicked() {
        let validate = Validate(usernameTextFeild, passwordTextFeild)
        showLoadingview()
        switch validate {
        case .Valid:
            Task {
                do {
                    let result = try await AuthManager.shared.login(username: usernameTextFeild.text!, password: passwordTextFeild.text!)
                    if result.status != 200 {
                        presentAlertOnMainThread(title: "Opps!", message: result.message ?? "N/A", btnTitle: "ok")
                        dismissLoding()
                    } else {
                        DispatchQueue.main.async {
                            let home = TabBarVC()
                            home.modalTransitionStyle = .crossDissolve
                            home.modalPresentationStyle = .fullScreen
                            self.present(home, animated: true)
                            self.dismissLoding()
                        }
                    }
                } catch {
                    if let err = error as? ExError {
                        presentAlertOnMainThread(title: "Opps!", message: "\(err.rawValue)", btnTitle: "ok")
                    } else {
                        presentDefaultError()
                    }
                    dismissLoding()
                }
            }
        case .InValid(let err):
            presentAlertOnMainThread(title: "Opps!", message: "\(err)", btnTitle: "OK")
            dismissLoding()
        }
    }
    
    @objc func loginwithPinClicked() {
        let pinLogin = UINavigationController(rootViewController: LoginWithPinVC())
        pinLogin.modalTransitionStyle = .coverVertical
        pinLogin.modalPresentationStyle = .popover
        present(pinLogin, animated: true)
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
            contentView.heightAnchor.constraint(equalToConstant: 820)
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
            loginImageView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    private func configureLoginAndRegisteryLabel() {
        loginglbl.text = "Login"
        loginglbl.font = .systemFont(ofSize: 40, weight: .bold)
        
        registeryLabel.text = "New Here"
        registeryLabel.font = .systemFont(ofSize: 22, weight: .regular)
        
        let leadingConstraintConstant = CGFloat(DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 90 : 130)

        NSLayoutConstraint.activate([
            loginglbl.topAnchor.constraint(equalTo: loginImageView.bottomAnchor, constant: 10),
            loginglbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            loginglbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            loginglbl.heightAnchor.constraint(equalToConstant: 50),
            
            
            registeryLabel.topAnchor.constraint(equalTo: loginWithPin.bottomAnchor, constant: 40),
            registeryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leadingConstraintConstant),
            registeryLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    private func configureLoginFromView() {
        usernameTextFeild.autocapitalizationType = .none
        loginFormView.translatesAutoresizingMaskIntoConstraints = false
        loginFormView.layer.cornerRadius = 10
        loginFormView.backgroundColor = .secondarySystemBackground
        
        usernameIcon.translatesAutoresizingMaskIntoConstraints = false
        usernameIcon.image = Images.usernameIcon
        usernameIcon.contentMode = .scaleAspectFill
        
        passwordIcon.translatesAutoresizingMaskIntoConstraints = false
        passwordIcon.image = Images.passwordIcon
        passwordIcon.contentMode = .scaleAspectFill
        
        loginFormView.addSubViews(usernameIcon, usernameTextFeild, passwordIcon, passwordTextFeild)
        
        usernameTextFeild.addLine(position: .bottom, color: .label, width: 0.5)
        
        passwordTextFeild.addLine(position: .bottom, color: .label, width: 0.4)
        
        NSLayoutConstraint.activate([
            
            loginFormView.topAnchor.constraint(equalTo: loginglbl.bottomAnchor, constant: 10),
            loginFormView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            loginFormView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            loginFormView.heightAnchor.constraint(equalToConstant: 130),
            
            usernameIcon.topAnchor.constraint(equalTo: loginFormView.topAnchor, constant: 20),
            usernameIcon.leadingAnchor.constraint(equalTo: loginFormView.leadingAnchor, constant: 10),
            usernameIcon.widthAnchor.constraint(equalToConstant: 35),
            usernameIcon.heightAnchor.constraint(equalToConstant: 35),
            
            usernameTextFeild.bottomAnchor.constraint(equalTo: usernameIcon.bottomAnchor),
            usernameTextFeild.leadingAnchor.constraint(equalTo: usernameIcon.trailingAnchor, constant: 6),
            usernameTextFeild.trailingAnchor.constraint(equalTo: loginFormView.trailingAnchor, constant: -20),
            usernameTextFeild.heightAnchor.constraint(equalToConstant: 50),
            
            passwordIcon.topAnchor.constraint(equalTo: usernameIcon.bottomAnchor, constant: 20),
            passwordIcon.leadingAnchor.constraint(equalTo: loginFormView.leadingAnchor, constant: 10),
            passwordIcon.widthAnchor.constraint(equalToConstant: 35),
            passwordIcon.heightAnchor.constraint(equalToConstant: 35),
            
            passwordTextFeild.bottomAnchor.constraint(equalTo: passwordIcon.bottomAnchor),
            passwordTextFeild.leadingAnchor.constraint(equalTo: passwordIcon.trailingAnchor, constant: 6),
            passwordTextFeild.trailingAnchor.constraint(equalTo: loginFormView.trailingAnchor, constant: -20),
            passwordTextFeild.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    private func configforgetBtn() {
                
        NSLayoutConstraint.activate([
            forgetPassword.topAnchor.constraint(equalTo: loginFormView.bottomAnchor, constant: 25),
            forgetPassword.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            forgetPassword.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat(DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 180 : 220)),
        ])
    }
    
    private func configLoginAndSingUpBtn() {
        
        NSLayoutConstraint.activate([
            loginBtn.topAnchor.constraint(equalTo: forgetPassword.bottomAnchor, constant: 20),
            loginBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -90),
            loginBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            loginBtn.heightAnchor.constraint(equalToConstant: 50),
            
            orLable.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 10),
            orLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            orLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            loginWithPin.topAnchor.constraint(equalTo: orLable.bottomAnchor, constant: 10),
            loginWithPin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -90),
            loginWithPin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            loginWithPin.heightAnchor.constraint(equalToConstant: 50),
            
            signUpbtn.topAnchor.constraint(equalTo: registeryLabel.bottomAnchor, constant: -22),
            signUpbtn.leadingAnchor.constraint(equalTo: registeryLabel.trailingAnchor, constant: 6),
            signUpbtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: CGFloat(DeviceTypes.isiPhoneSE ? -90 : -100)),
            signUpbtn.heightAnchor.constraint(equalTo: registeryLabel.heightAnchor)
            
        ])
    }
    
    @objc private func pushForgetVC() {
        let ForgetVC = UINavigationController(rootViewController: ForgetPasswordVC())
        present(ForgetVC, animated: true)
    }
    
    @objc private func pushSingUpVC() {
        let singUPVC = UINavigationController(rootViewController: SingUpVC())
        singUPVC.modalPresentationStyle = .popover
        singUPVC.modalTransitionStyle   = .coverVertical
        present(singUPVC, animated: true, completion: nil)
    }

}

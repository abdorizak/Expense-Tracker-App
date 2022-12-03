//
//  SingUpVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/1/22.
//
// UI DESING

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
    private let pinTextFeild                  = CustomTextFields(textContentType: .newPassword, isSecureTextEntry: true, placeholder: "PIN Number")
    private let passwordTextFeild            = CustomTextFields(textContentType: .newPassword, isSecureTextEntry: true, placeholder: "Password")
    private let confirmPasswordTextFeild     = CustomTextFields(textContentType: .newPassword, isSecureTextEntry: true, placeholder: "Confirm Password")
    

    private var items: [CustomTextFields] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configVC()
    }
    
    private func configVC() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissVC))
        let tap  = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        configScrollView()
        ContentView.addSubViews(signUPImage, signUplabel, signUpView, signUpBtn)
        configSingUPImage()
        configSignUpFormView()
        configSignUPBtn()
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
            signUPImage.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    private func configSignUpFormView() {
        signUpView.addSubViews(fullnameTextFeild, emailTextFeild, phoneTextFeild, usernameTextFeild, pinTextFeild, passwordTextFeild, confirmPasswordTextFeild)
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        signUpView.backgroundColor = .secondarySystemBackground
        signUpView.layer.cornerRadius = 15
        
        items = [fullnameTextFeild, emailTextFeild, phoneTextFeild, usernameTextFeild, passwordTextFeild, confirmPasswordTextFeild, pinTextFeild]
        
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
            signUpView.heightAnchor.constraint(equalToConstant: 450),
            
            
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
            
            pinTextFeild.topAnchor.constraint(equalTo: usernameTextFeild.bottomAnchor, constant: 20),
            pinTextFeild.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -20),
            pinTextFeild.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 20),
            pinTextFeild.heightAnchor.constraint(equalToConstant: 45),

            passwordTextFeild.topAnchor.constraint(equalTo: pinTextFeild.bottomAnchor, constant: 20),
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
        signUpBtn.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        NSLayoutConstraint.activate([
            signUpBtn.topAnchor.constraint(equalTo: signUpView.bottomAnchor, constant: 20),
            signUpBtn.trailingAnchor.constraint(equalTo: ContentView.trailingAnchor, constant: -80),
            signUpBtn.leadingAnchor.constraint(equalTo: ContentView.leadingAnchor, constant: 80),
            signUpBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


extension SingUpVC: UITextFieldDelegate {
    
    @objc func didTapSignUp() {
        let validate = Validate(fullnameTextFeild, emailTextFeild, phoneTextFeild, usernameTextFeild, pinTextFeild, passwordTextFeild, confirmPasswordTextFeild)
        showLoadingview()
        switch validate {
        case .Valid:
            Task {
                do {
                    let signUpResult = try await NetworkManager.shared.Signup(fullname: fullnameTextFeild.text!, email: emailTextFeild.text!, mobile: phoneTextFeild.text!, username: usernameTextFeild.text!, pin: Int(pinTextFeild.text!)!, passowrd: passwordTextFeild.text!)
                    presentAlertOnMainThread(title: "\(signUpResult.status == 200 ? "Success" : "Opss!")", message: signUpResult.message ?? "N/A", btnTitle: "Ok")
                    dismissLoding()
                } catch {
                    print(error)
                    if let err = error as? ExError {
                        presentAlertOnMainThread(title: "Opps!", message: "\(err)", btnTitle: "ok")
                        print(err)
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 4
        
        let currentText: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentText.replacingCharacters(in: range, with: string) as NSString
        
        return newString.length <= maxLength
    }
}

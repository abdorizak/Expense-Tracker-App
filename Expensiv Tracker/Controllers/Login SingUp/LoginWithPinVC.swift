//
//  LoginWithPinVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 7/30/22.
//

import UIKit


class LoginWithPinVC: UIViewController {
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Images.login_pin_background
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let passInput1   = CustomTextFields(isSecureTextEntry: true)
    private let passInput2   = CustomTextFields(isSecureTextEntry: true)
    private let passInput3   = CustomTextFields(isSecureTextEntry: true)
    private let passInput4   = CustomTextFields(isSecureTextEntry: true)
    
    private let viewInput1 = UIView()
    private let viewInput2 = UIView()
    private let viewInput3 = UIView()
    private let viewInput4 = UIView()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution  = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    
    private let goButton = UIButton(type: .system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configVC()
    }
    
    private func configVC() {
        view.backgroundColor = .systemBackground
        title = "Enter your PIN"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapBack))
        view.addSubViews(backgroundImage, stackView, goButton)
        configbackgroundandStacks()
        configGobtn()
        passInput1.becomeFirstResponder()
        let tap  = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func configbackgroundandStacks() {
        [viewInput1,viewInput2,viewInput3,viewInput4].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .clear
        }
        
        [passInput1, passInput2, passInput3, passInput4].forEach {
            $0.addLine(position: .bottom, color: .label, width: 0.4)
            $0.attributedPlaceholder = NSAttributedString(string: "0", attributes: [NSAttributedString.Key.font : UIFont(name: "Marker Felt Thin", size: 22) ?? "", NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.2)])
            $0.delegate = self
            $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
        
        viewInput1.addSubview(passInput1)
        viewInput2.addSubview(passInput2)
        viewInput3.addSubview(passInput3)
        viewInput4.addSubview(passInput4)
        
        stackView.addArrangedSubviews(viewInput1,viewInput2,viewInput3,viewInput4)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backgroundImage.heightAnchor.constraint(equalToConstant: CGFloat(DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 180 : 200)),
            
            passInput1.centerXAnchor.constraint(equalTo: viewInput1.centerXAnchor),
            passInput1.centerYAnchor.constraint(equalTo: viewInput1.centerYAnchor),
            passInput1.heightAnchor.constraint(greaterThanOrEqualToConstant: 65),
            passInput1.widthAnchor.constraint(greaterThanOrEqualToConstant: 65),
            
            passInput2.centerXAnchor.constraint(equalTo: viewInput2.centerXAnchor),
            passInput2.centerYAnchor.constraint(equalTo: viewInput2.centerYAnchor),
            passInput2.heightAnchor.constraint(greaterThanOrEqualToConstant: 65),
            passInput2.widthAnchor.constraint(greaterThanOrEqualToConstant: 65),
            
            passInput3.centerXAnchor.constraint(equalTo: viewInput3.centerXAnchor),
            passInput3.centerYAnchor.constraint(equalTo: viewInput3.centerYAnchor),
            passInput3.heightAnchor.constraint(greaterThanOrEqualToConstant: 65),
            passInput3.widthAnchor.constraint(greaterThanOrEqualToConstant: 65),
            
            passInput4.centerXAnchor.constraint(equalTo: viewInput4.centerXAnchor),
            passInput4.centerYAnchor.constraint(equalTo: viewInput4.centerYAnchor),
            passInput4.heightAnchor.constraint(greaterThanOrEqualToConstant: 65),
            passInput4.widthAnchor.constraint(greaterThanOrEqualToConstant: 65),
            
            stackView.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    private func configGobtn() {
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: "chevron.right.circle.fill")
        config.imagePlacement = .trailing
        config.buttonSize = .large
        //        config.title = "Go"
        goButton.configuration = config
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.addAction(UIAction(handler: { [self] _ in
            pinLogin()
        }), for: .touchUpInside)
        NSLayoutConstraint.activate([
            goButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            goButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            goButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
        ])
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let text = textField.text
        
        if text?.count == 1 {
            switch textField {
            case passInput1:
                passInput2.becomeFirstResponder()
            case passInput2:
                passInput3.becomeFirstResponder()
            case passInput3:
                passInput4.becomeFirstResponder()
            case passInput4:
                passInput4.becomeFirstResponder()
                self.dismissKeyboard()
            default:
                break
            }
        }
        
        if text?.count == 0 {
            switch textField {
            case passInput1:
                passInput1.becomeFirstResponder()
            case passInput2:
                passInput1.becomeFirstResponder()
            case passInput3:
                passInput2.becomeFirstResponder()
            case passInput4:
                passInput3.becomeFirstResponder()
            default:
                break
            }
        }
    }
    
    func pinLogin() {
        let validate = Validate(passInput1, passInput2, passInput3, passInput4)
        let pin = String(passInput1.text! + passInput2.text! + passInput3.text! + passInput4.text!)
        guard let pin = Int(pin) else { return }
        showLoadingview()
        switch validate {
            case .Valid:
                Task {
                    do {
                        let result = try await AuthManager.shared.login(with: pin)
                        if result.status != 200 {
                            presentAlertOnMainThread(title: "Opps!", message: "\(result.message ?? "N/A") 😁", btnTitle: "ok")
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
    
    @objc func didTapBack() {
        self.dismissVC()
    }
    
}

extension LoginWithPinVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        
        let currentText: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentText.replacingCharacters(in: range, with: string) as NSString
        
        return newString.length <= maxLength
    }
}

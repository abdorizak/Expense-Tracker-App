//
//  UIViewController+Ext.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/4/22.
//
// UI DESING

import UIKit

fileprivate var containerView: UIView!


enum UserValidateState {
    case Valid
    case InValid(String)
}

extension UIViewController {
    
    func presentAlertOnMainThread(title: String, message: String, btnTitle: String) {
        DispatchQueue.main.async {
            let ac = AlertController(title: title, message: message, buttonTitle: btnTitle)
            ac.modalPresentationStyle = .overFullScreen
            ac.modalTransitionStyle = .crossDissolve
            self.present(ac, animated: true)
        }
    }
    
    func Validate(_ username: UITextField, _ pass: UITextField) -> UserValidateState {
        if (username.text?.isEmpty)! && (pass.text?.isEmpty)! {
            return .InValid("Username and password cannot be Empty.")
        } else if (username.text?.isEmpty)! {
            return .InValid("Username cannot be Empty.")
        } else if (pass.text?.isEmpty)! {
            return .InValid("password cannot be Empty.")
        }
        return .Valid
    }
    
    func Validate(_ amount: UITextField, _ type: UITextField, _ title: UITextField, _ description: UITextField, _ date: UITextField) -> UserValidateState {
        if (amount.text?.isEmpty)! && (type.text?.isEmpty)! && (title.text?.isEmpty)! && (description.text?.isEmpty)! && (date.text?.isEmpty)! {
            return .InValid("Fill All TextFields. 🥊")
        } else if (amount.text?.isEmpty)! {
            return .InValid("Amount cannot be Empty.")
        } else if (type.text?.isEmpty)! {
            return .InValid("Type cannot be Empty.")
        } else if (description.text?.isEmpty)! {
            return .InValid("Description cannot be Empty.")
        } else if (date.text?.isEmpty)! {
            return .InValid("Date cannot be Empty.")
        }
        return .Valid
    }
    
    
    func Validate(_ p1: UITextField, _ p2: UITextField, _ p3: UITextField, _ p4: UITextField) -> UserValidateState {
        if (p1.text?.isEmpty)! && (p2.text?.isEmpty)! && (p3.text?.isEmpty)! && (p4.text?.isEmpty)! {
            return .InValid("Pin Number cannot be Empty")
        } else if (p1.text?.isEmpty)! {
            return .InValid("pin 1 cannot be Empty.")
        } else if (p2.text?.isEmpty)! {
            return .InValid("pin 2 cannot be Empty.")
        } else if (p3.text?.isEmpty)! {
            return .InValid("pin 3 cannot be Empty.")
        } else if (p4.text?.isEmpty)! {
            return .InValid("pin 4 cannot be Empty.")
        }
        return .Valid
    }
    
    func Validate(_ fullname: UITextField, _ email: UITextField, _ mobile: UITextField, _ username: UITextField, _ pin: UITextField, _ password: UITextField, _ confirmPass: UITextField) -> UserValidateState {
        if (fullname.text?.isEmpty)! && (email.text?.isEmpty)! && (mobile.text?.isEmpty)! && (username.text?.isEmpty)! && (pin.text?.isEmpty)! && (password.text?.isEmpty)!, (confirmPass.text?.isEmpty)! {
            return .InValid("feilds cannot be Empty")
        } else if (fullname.text?.isEmpty)! {
            return .InValid("fullname cannot be Empty.")
        } else if (email.text?.isEmpty)! {
            return .InValid("email cannot be Empty.")
        } else if (mobile.text?.isEmpty)! {
            return .InValid("mobile cannot be Empty.")
        } else if (username.text?.isEmpty)! {
            return .InValid("username cannot be Empty.")
        } else if (pin.text?.isEmpty)! {
            return .InValid("pin cannot be Empty.")
        } else if (password.text?.isEmpty)! {
            return .InValid("password cannot be Empty.")
        } else if (confirmPass.text?.isEmpty)! {
            return .InValid("confirmPass cannot be Empty.")
        } else if password.text != confirmPass.text {
            return .InValid("password and ConfirmPassword should be same")
        }
        return .Valid
    }
    
    func presentDefaultError() {
        let alertVC = AlertController(title: "Something Went Wrong",
                                      message: "We were unable to complete your task at this time. Please try again.",
                                      buttonTitle: "Ok")
        alertVC.modalPresentationStyle  = .overFullScreen
        alertVC.modalTransitionStyle    = .crossDissolve
        present(alertVC, animated: true)
    }
    
    func showLoadingview() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8  }
        
        let activatyIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activatyIndicator)
        
        activatyIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activatyIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activatyIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        activatyIndicator.startAnimating()
    }
    
    func dismissLoding() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
}

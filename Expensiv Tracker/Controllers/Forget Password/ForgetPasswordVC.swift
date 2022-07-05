//
//  ForgetPasswordVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/2/22.
//
// UI DESING

import UIKit

class ForgetPasswordVC: UIViewController {
    
    
    let forgetPasswordImage = UIImageView()
    let forgetuserTextFeild = ForgetPasswordTextFeild()

    override func viewDidLoad() {
        super.viewDidLoad()
        configfVC()
        configForgetLoginImage()
        configforgetTxtFeild()
    }
    
    private func configfVC() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Forget Password"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissVC))
        view.addSubViews(forgetPasswordImage, forgetuserTextFeild)
    }
    
    private func configForgetLoginImage() {
        forgetPasswordImage.image = Images.forgetpassword_Image
        forgetPasswordImage.contentMode = .scaleAspectFit
        forgetPasswordImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            forgetPasswordImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            forgetPasswordImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgetPasswordImage.heightAnchor.constraint(equalToConstant: 350),
            forgetPasswordImage.widthAnchor.constraint(equalToConstant: 350),
        ])
    }
    
    private func configforgetTxtFeild() {
        
        NSLayoutConstraint.activate([
            forgetuserTextFeild.topAnchor.constraint(equalTo: forgetPasswordImage.bottomAnchor, constant: 20),
            forgetuserTextFeild.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            forgetuserTextFeild.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            forgetuserTextFeild.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }

}

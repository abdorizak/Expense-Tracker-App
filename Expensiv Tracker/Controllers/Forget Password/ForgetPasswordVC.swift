//
//  ForgetPasswordVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/2/22.
//
// UI DESING

import UIKit

class ForgetPasswordVC: UIViewController {
    
    // MARK: - ImageView UIView CustomTextFeild
    let forgetPasswordImage = UIImageView()
    let forgetView           = UIView()
    let forgetuserTextFeild = ForgetPasswordTextFeild()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configfVC()
    }
    
    private func configfVC() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Forget Password"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissVC))
        view.addSubViews(forgetPasswordImage, forgetView)
        configForgetLoginImage()
        configforgetTxtFeild()
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
        forgetView.addSubview(forgetuserTextFeild)
        forgetView.translatesAutoresizingMaskIntoConstraints = false
        forgetView.backgroundColor     = .secondarySystemBackground
        forgetView.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            
            forgetView.topAnchor.constraint(equalTo: forgetPasswordImage.bottomAnchor, constant: 20),
            forgetView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            forgetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            forgetView.heightAnchor.constraint(equalToConstant: 60),
            
            forgetuserTextFeild.topAnchor.constraint(equalTo: forgetView.topAnchor, constant: 8),
            forgetuserTextFeild.trailingAnchor.constraint(equalTo: forgetView.trailingAnchor, constant: -12),
            forgetuserTextFeild.leadingAnchor.constraint(equalTo: forgetView.leadingAnchor, constant: 12),
//            forgetuserTextFeild.bottomAnchor.constraint(equalTo: forgetView.bottomAnchor, constant: 8),
            forgetuserTextFeild.heightAnchor.constraint(equalToConstant: 45)
        ])
        
    }

}

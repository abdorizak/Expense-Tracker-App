//
//  SingUpVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/1/22.
//

import UIKit

class SingUpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()  
        configVC()
    }
    
    private func configVC() {
        view.backgroundColor = .systemBackground
        title = "Sing Up"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Login", style: .done, target: self, action: #selector(dismissVC))
    }
}




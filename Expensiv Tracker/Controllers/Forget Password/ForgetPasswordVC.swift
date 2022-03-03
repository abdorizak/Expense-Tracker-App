//
//  ForgetPasswordVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/2/22.
//

import UIKit

class ForgetPasswordVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configfVC()
        
    }
    
    private func configfVC() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Forget Password"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: nil)
    }
    

}

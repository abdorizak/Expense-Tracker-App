//
//  ViewController.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 2/28/22.
//

import UIKit

class HomeVC: UIViewController {
    
    private let userImage       = AvatarImageView(frame: .zero)
    private let welcomeLabel    = CustomLabel(textAlignment: .left, fontSize: 20, textWeight: .ultraLight, text: "Hi Welcome")
    private let fullnameLabel           = CustomLabel(textAlignment: .left, fontSize: 18, textWeight: .regular)
    private let balanceInfo             = CardView(frame: .zero)
    private let transectionsLabel       = CustomLabel(textAlignment: .left, fontSize: 24, textWeight: .medium, text: "Transections")
    private let setting: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "text.alignright")
        image.tintColor = .systemGray2
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let headerView              = UIView()
    private let tableView: UITableView  = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configHomeVC()
    }
    
    func configHomeVC() {
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
        tableView.delegate   = self
        tableView.dataSource = self
        view.addSubViews(headerView, balanceInfo, transectionsLabel, tableView)
        ConfigureHeaderView()
        ConfigureHeaderElements()
        configureShowBlanceView()
        configTransectionLabel()
        configTableView()
    }
    
    private func ConfigureHeaderView() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.layer.cornerRadius = 5
        headerView.layer.shouldRasterize = true
        headerView.layer.rasterizationScale = UIScreen.main.scale
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapSetting))
        setting.addGestureRecognizer(tap)
        setting.isUserInteractionEnabled = true
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    @objc func didTapSetting() {
        print("Tapped....")
    }
    
    private func ConfigureHeaderElements() {
        headerView.addSubViews(userImage, welcomeLabel, fullnameLabel, setting)
        userImage.layer.cornerRadius = 10
        fullnameLabel.text = "Abdorizak Abdalla"
        
        setting.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            userImage.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            userImage.widthAnchor.constraint(equalToConstant: 50),
            userImage.heightAnchor.constraint(equalToConstant: 50),
            
            welcomeLabel.topAnchor.constraint(equalTo: userImage.topAnchor),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            welcomeLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 8),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 22),

            fullnameLabel.bottomAnchor.constraint(equalTo: userImage.bottomAnchor),
            fullnameLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 8),
            fullnameLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            fullnameLabel.heightAnchor.constraint(equalToConstant: 26),
            
            setting.centerYAnchor.constraint(equalTo: userImage.centerYAnchor),
            setting.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            setting.widthAnchor.constraint(equalToConstant: 40),
            setting.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }

    
    private func configureShowBlanceView() {
        balanceInfo.layer.shouldRasterize = true
        balanceInfo.layer.rasterizationScale = UIScreen.main.scale

        NSLayoutConstraint.activate([
            balanceInfo.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            balanceInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            balanceInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            balanceInfo.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    
    private func configTransectionLabel() {
        NSLayoutConstraint.activate([
            transectionsLabel.topAnchor.constraint(equalTo: balanceInfo.bottomAnchor, constant: 20),
            transectionsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            transectionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            transectionsLabel.heightAnchor.constraint(equalToConstant: 26)
        ])
    }
    
    
    private func configTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: transectionsLabel.bottomAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}


extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        return UITableViewCell()
    }
    
    
}


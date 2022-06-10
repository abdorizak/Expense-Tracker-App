//
//  ViewController.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 2/28/22.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: HeaderView
    private let headerView              = UIView()
    
    // MARK: - HeaderView Item's
    private let userImage       = AvatarImageView(frame: .zero)
    private let welcomeLabel    = CustomLabel(textAlignment: .left, fontSize: 20, textWeight: .ultraLight, text: "Hi Welcome")
    private let fullnameLabel           = CustomLabel(textAlignment: .left, fontSize: 18, textWeight: .regular)
    private let profile: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "text.alignright")
        image.tintColor = .systemGray2
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Card View
    private let balanceInfo             = CardView(frame: .zero)
    
    // MARK: - Transection Label & Table View Label
    private let transectionsLabel       = CustomLabel(textAlignment: .left, fontSize: 24, textWeight: .medium, text: "Transections")

    // MARK: - Card View Balance
    private let totalBalanceLabel       = CustomLabel(textAlignment: .center, fontSize: 20, textWeight: .semibold, text: "Total Balance")
    
    private let balanceNumber           = CustomLabel(textAlignment: .center, fontSize: 66, textWeight: .bold)
    
    // MARK: - Card View Income and expenses image and labels
    private let incomeArrowIcon: UIImageView = {
        let img = UIImageView(frame: .zero)
        img.contentMode = .scaleAspectFill
        img.image = UIImage(systemName: "arrow.down")
        img.tintColor = .green
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let expensesArrowIcon: UIImageView = {
        let img = UIImageView(frame: .zero)
        img.contentMode = .scaleAspectFill
        img.image = UIImage(systemName: "arrow.up")
        img.tintColor = .red
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let incomelbl   = CustomLabel(textAlignment: .left, fontSize: 13, textWeight: .light, text: "Income")
    private let expenseslbl   = CustomLabel(textAlignment: .left, fontSize: 13, textWeight: .light, text: "Expenses")
    private let lastIncome  = CustomLabel(textAlignment: .left, fontSize: 26)
    private let lastExpense = CustomLabel(textAlignment: .left, fontSize: 26)
     
    private let tableView: UITableView  = {
        let table = UITableView()
        table.register(TransectionTableViewCell.self, forCellReuseIdentifier: TransectionTableViewCell.identifier)
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        return table
    }()
    
    // MARK: - User Balnce and Income & Expense
    var userBalance: UserIncomeAndExpense = .init(balance: 6000, income: 1000, Expense: 2000)
    
    // MARK: - Transection data
    let transection: [Transections] = [
        .init(title: "Hayaat Market", description: "Waxaa soo Gatay 3 Shaati Anigoo iska maraayo taleex aa arkay suuqa xayaat. Waxaa soo Gatay 3 Shaati Anigoo iska maraayo taleex aa arkay suuqa xayaat", type: "Expense", ammount: 392.80),
        .init(title: "Gadasho Dhar", description: "Waxaan Maanta Soo ibsaday 2 Shaati 3 Surwaal iyo nigis", type: "Expense", ammount: 56.0),
        .init(title: "Mishaar", description: "waxaa Helay Mishaar Kasocda Company X", type: "Income", ammount: 6829.00),
    ]
    
    
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
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapSetting))
        profile.addGestureRecognizer(tap)
        profile.isUserInteractionEnabled = true
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
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    @objc func didTapSetting() {
        let profileVC = UINavigationController(rootViewController: ProfileVC())
        profileVC.modalPresentationStyle = .popover
        profileVC.modalTransitionStyle   = .coverVertical
        present(profileVC, animated: true, completion: nil)
    }
    
    private func ConfigureHeaderElements() {
        headerView.addSubViews(userImage, welcomeLabel, fullnameLabel, profile)
        userImage.layer.cornerRadius = 25
        fullnameLabel.text = "Abdorizak Abdalla"
        
        profile.layer.cornerRadius = 10
        
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
            
            profile.centerYAnchor.constraint(equalTo: userImage.centerYAnchor),
            profile.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            profile.widthAnchor.constraint(equalToConstant: 30),
            profile.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }

    
    private func configureShowBlanceView() {
        balanceInfo.addSubViews(totalBalanceLabel, balanceNumber, incomeArrowIcon, expensesArrowIcon, incomelbl, lastIncome, expenseslbl, lastExpense)
        
        balanceNumber.text = String("$\(userBalance.balance)")
        
        lastIncome.attributedText         = makeFormattedBalance(dollar: String(userBalance.income))
        lastIncome.textColor    = .white
        incomelbl.textColor     = .white
        
        lastExpense.attributedText        = makeFormattedBalance(dollar: String(userBalance.Expense))
        expenseslbl.textColor   = .white
        lastExpense.textColor   = .white
        
        balanceInfo.layer.shouldRasterize = true
        balanceInfo.layer.rasterizationScale = UIScreen.main.scale

        totalBalanceLabel.textColor = .white
        balanceNumber.textColor     = .white
        
        NSLayoutConstraint.activate([
            balanceInfo.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            balanceInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            balanceInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            balanceInfo.heightAnchor.constraint(equalToConstant: 230),
            
            totalBalanceLabel.topAnchor.constraint(equalTo: balanceInfo.topAnchor, constant: 30),
            totalBalanceLabel.trailingAnchor.constraint(equalTo: balanceInfo.trailingAnchor),
            totalBalanceLabel.leadingAnchor.constraint(equalTo: balanceInfo.leadingAnchor),
            totalBalanceLabel.heightAnchor.constraint(equalToConstant: 24),
            
            balanceNumber.topAnchor.constraint(equalTo: totalBalanceLabel.bottomAnchor, constant: 10),
            balanceNumber.trailingAnchor.constraint(equalTo: balanceInfo.trailingAnchor),
            balanceNumber.leadingAnchor.constraint(equalTo: balanceInfo.leadingAnchor),
            balanceNumber.heightAnchor.constraint(equalToConstant: 75),
            
            incomeArrowIcon.topAnchor.constraint(equalTo: balanceNumber.bottomAnchor, constant: 40),
            incomeArrowIcon.leadingAnchor.constraint(equalTo: balanceInfo.leadingAnchor, constant: 20),
            incomeArrowIcon.widthAnchor.constraint(equalToConstant: 35),
            incomeArrowIcon.heightAnchor.constraint(equalToConstant: 35),
            
            incomelbl.topAnchor.constraint(equalTo: incomeArrowIcon.topAnchor, constant: -10),
            incomelbl.leadingAnchor.constraint(equalTo: incomeArrowIcon.trailingAnchor, constant: 8),
            incomelbl.trailingAnchor.constraint(equalTo: expensesArrowIcon.trailingAnchor, constant: -30),
            incomelbl.heightAnchor.constraint(equalToConstant: 13),
            
            lastIncome.bottomAnchor.constraint(equalTo: incomeArrowIcon.bottomAnchor),
            lastIncome.leadingAnchor.constraint(equalTo: incomeArrowIcon.trailingAnchor, constant: 8),
            lastIncome.trailingAnchor.constraint(equalTo: expensesArrowIcon.trailingAnchor, constant: -20),
            lastIncome.heightAnchor.constraint(equalToConstant: 28),
            
            expensesArrowIcon.centerYAnchor.constraint(equalTo: incomeArrowIcon.centerYAnchor),
            expensesArrowIcon.trailingAnchor.constraint(equalTo: balanceInfo.trailingAnchor, constant: -120),
            expensesArrowIcon.widthAnchor.constraint(equalToConstant: 35),
            expensesArrowIcon.heightAnchor.constraint(equalToConstant: 35),
            
            expenseslbl.topAnchor.constraint(equalTo: incomeArrowIcon.topAnchor, constant: -10),
            expenseslbl.leadingAnchor.constraint(equalTo: expensesArrowIcon.trailingAnchor, constant: 8),
            expenseslbl.trailingAnchor.constraint(equalTo: balanceInfo.trailingAnchor, constant: -30),
            expenseslbl.heightAnchor.constraint(equalToConstant: 13),
            
            lastExpense.bottomAnchor.constraint(equalTo: expensesArrowIcon.bottomAnchor),
            lastExpense.leadingAnchor.constraint(equalTo: expensesArrowIcon.trailingAnchor, constant: 8),
            lastExpense.trailingAnchor.constraint(equalTo: balanceInfo.trailingAnchor, constant: -20),
            lastExpense.heightAnchor.constraint(equalToConstant: 28),
            
        ])
    }
    
    
    private func configTransectionLabel() {
        NSLayoutConstraint.activate([
            transectionsLabel.topAnchor.constraint(equalTo: balanceInfo.bottomAnchor, constant: 30),
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
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}


extension HomeVC: BalanceFormater, UITableViewDataSource, UITableViewDelegate {
    
    func makeFormattedBalance(dollar: String) -> NSMutableAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollar, attributes: dollarAttributes)

        
        rootString.append(dollarString)
        
        return rootString
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransectionTableViewCell.identifier, for: indexPath) as! TransectionTableViewCell
        cell.selectionStyle = .none
        cell.display(transection[indexPath.row])
        return cell
    }
 
}


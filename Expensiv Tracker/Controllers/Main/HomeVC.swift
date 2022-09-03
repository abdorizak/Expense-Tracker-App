//
//  ViewController.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 2/28/22.
//
// UI DESING

import UIKit

class HomeVC: UIViewController {
    
    // MARK: HeaderView
    private let headerView              = UIView()
    private let Statechanger            = UIView()
    private let messageLabel    = AlertTitleLabel(textAlignment: .center, fontSize: 20)
    
    // MARK: - HeaderView Item's
    private let userImage       = AvatarImageView(frame: .zero)
    private let welcomeLabel    = CustomLabel(textAlignment: .left, fontSize: 20, textWeight: .ultraLight, text: "Hi Welcome")
    private let fullnameLabel           = CustomLabel(textAlignment: .left, fontSize: 18, textWeight: .regular)
    
    private let profile = AvatarImageView(color: .systemGray2, icon: "text.alignright", mode: .scaleAspectFit)
    
    // MARK: - Card View
    private let balanceInfo             = CardView(frame: .zero)
    
    // MARK: - Transection Label & Table View Label
    private let transectionsLabel       = CustomLabel(textAlignment: .left, fontSize: 24, textWeight: .medium, text: "Transections")
    
    // MARK: - Card View Balance
    private let totalBalanceLabel       = CustomLabel(textAlignment: .center, fontSize: 20, textWeight: .semibold, text: "Total Balance")
    
    private let balanceNumber           = CustomLabel(textAlignment: .center, fontSize: 66, textWeight: .bold)
    
    // MARK: - Card View Income and expenses image and labels
    private let incomeArrowIcon = AvatarImageView(color: .green, icon: "arrow.down", mode: .scaleAspectFill)
    
    private let expensesArrowIcon = AvatarImageView(color: .red, icon: "arrow.up", mode: .scaleAspectFit)
    
    private let incomelbl   = CustomLabel(textAlignment: .left, fontSize: 13, textWeight: .light, text: "Income")
    private let expenseslbl   = CustomLabel(textAlignment: .left, fontSize: 13, textWeight: .light, text: "Expenses")
    private let lastIncome  = CustomLabel(textAlignment: .left, fontSize: 20)
    private let lastExpense = CustomLabel(textAlignment: .left, fontSize: 18)
    
    private let tableView = CustomTableView(indicator: false, separtorStyle: .singleLine, TransectionTableViewCell.self, forCellReuseIdentifier: TransectionTableViewCell.identifier)
    private let viewMoreButton = UIButton(type: .system)
    
    
    // MARK: - Transection data
    var transaction = [Transaction]()
    
    var profileData: UserBalanceIncomeExpense?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configHomeVC()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
        fetchTrasanction()
    }
    
    func configHomeVC() {
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubViews(headerView, balanceInfo, transectionsLabel, viewMoreButton, tableView, Statechanger)
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapSetting))
        profile.addGestureRecognizer(tap)
        profile.isUserInteractionEnabled = true
        fetchData()
        ConfigureHeaderView()
        ConfigureHeaderElements()
        configTransectionLabel()
        configStateView()
        fetchTrasanction()
    }
    
    
    private func fetchData() {
        Task {
            do {
                let userData = try await NetworkManager.shared.getDashboardData()
                self.profileData = userData
                print(profileData)
                configData(userData)
            } catch {
                print(error)
            }
        }
    }
    
    private func fetchTrasanction() {
        Task {
            do {
                let transactions = try await NetworkManager.shared.getTransaction()
                self.transaction = transactions.transaction
                if !transaction.isEmpty {
                    configTableView()
                    self.tableView.reloadDataOnMainThread()
                } else {
                    layoutLable("This user doesn't have any Transactions. Go an make Expenses or Income 😀.")
                }
            } catch {
                print(error.localizedDescription)
            }
        }
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
        guard let profileData = profileData else {
            return
        }
        let profileVC = UINavigationController(rootViewController: ProfileVC(eStatement: transaction, userImage: profileData.user.avatar, fullname: profileData.user.name))
        profileVC.modalPresentationStyle = .popover
        profileVC.modalTransitionStyle   = .coverVertical
        present(profileVC, animated: true, completion: nil)
    }
    
    private func configData(_ data: UserBalanceIncomeExpense){
        fullnameLabel.text = data.user.name
        userImage.downloadImage(fromURL: "http://localhost:4400/" + data.user.avatar)
        balanceNumber.text = "$\(data.balance)"
        lastIncome.attributedText         = makeFormattedBalance(dollar: String(format:"%.01f", data.income))
        lastExpense.attributedText        = makeFormattedBalance(dollar: String(data.expense))
    }
    
    private func ConfigureHeaderElements() {
        headerView.addSubViews(userImage, welcomeLabel, fullnameLabel, profile)
        userImage.layer.cornerRadius = 25
        
        profile.layer.cornerRadius = 10
        balanceInfo.addSubViews(totalBalanceLabel, balanceNumber, incomeArrowIcon, expensesArrowIcon, incomelbl, lastIncome, expenseslbl, lastExpense)
        
        lastIncome.textColor    = .white
        incomelbl.textColor     = .white
        
        
        expenseslbl.textColor   = .white
        lastExpense.textColor   = .white
        
        balanceInfo.layer.shouldRasterize = true
        balanceInfo.layer.rasterizationScale = UIScreen.main.scale
        
        totalBalanceLabel.textColor = .white
        balanceNumber.textColor     = .white

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
            profile.heightAnchor.constraint(equalToConstant: 30),
            
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
            lastExpense.trailingAnchor.constraint(equalTo: balanceInfo.trailingAnchor, constant: -10),
            lastExpense.heightAnchor.constraint(equalToConstant: 28),
        ])
        
    }
    

    private func configTransectionLabel() {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "arrow.right.circle")
        config.imagePlacement = .trailing
        config.title = "More "
        viewMoreButton.configuration = config
        viewMoreButton.translatesAutoresizingMaskIntoConstraints = false
        viewMoreButton.addAction(UIAction(handler: { _ in
            let transactionVC = UINavigationController(rootViewController: AllTransaction(Transactions: self.transaction))
            transactionVC.modalPresentationStyle = .popover
            transactionVC.modalTransitionStyle   = .coverVertical
            self.present(transactionVC, animated: true, completion: nil)
        }), for: .touchUpInside)
        NSLayoutConstraint.activate([
            transectionsLabel.topAnchor.constraint(equalTo: balanceInfo.bottomAnchor, constant: 30),
            transectionsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            transectionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            transectionsLabel.heightAnchor.constraint(equalToConstant: 26),
            
            viewMoreButton.topAnchor.constraint(equalTo: balanceInfo.bottomAnchor, constant: 30),
            viewMoreButton.centerYAnchor.constraint(equalTo: transectionsLabel.centerYAnchor),
            viewMoreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            viewMoreButton.heightAnchor.constraint(equalTo: transectionsLabel.heightAnchor)
        ])
    }
    
    
    private func configTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: Statechanger.topAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: Statechanger.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: Statechanger.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: Statechanger.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configStateView() {
        Statechanger.addSubview(messageLabel)
        Statechanger.addSubview(tableView)
        Statechanger.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            Statechanger.topAnchor.constraint(equalTo: transectionsLabel.bottomAnchor, constant: 10),
            Statechanger.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            Statechanger.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            Statechanger.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
    }
    
    func layoutLable(_ msg: String) {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = msg
        messageLabel.numberOfLines  = 3
        messageLabel.textColor      = .secondaryLabel
                
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: Statechanger.centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: Statechanger.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: Statechanger.trailingAnchor, constant: -40),
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
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransectionTableViewCell.identifier, for: indexPath) as! TransectionTableViewCell
        cell.selectionStyle = .none
        cell.display(transaction[indexPath.row])
        return cell
    }
    
}


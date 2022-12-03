//
//  ProfileVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/27/22.
//
// UI DESING

import UIKit

// MARK: - Sections
private struct Sections {
    let options: [SettingOpetions]
}

private struct SettingOpetions {
    let icon: UIImage?
    let title: String
    let handler: () -> Void?
}

class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    enum logoutOptions: CaseIterable {
        case logout
        case cancel
    }

    private var models: [Sections] = []
    
    // MARK: - TableView
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    var eTrasactions: [Transaction] = []
    var userImage: String = ""
    var fullname: String = ""
    
    init(eStatement: [Transaction], userImage: String, fullname: String) {
        super.init(nibName: nil, bundle: nil)
        self.eTrasactions = eStatement
        self.fullname = fullname
        self.userImage = userImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configProfileVC()
        configTableView()
        setupTableHeaderView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        setupTableHeaderView()
    }
    
    private func configProfileVC() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        title = "Profile"
    }
    
    private func setupTableHeaderView() {
        let header = ProfileHeaderView(user: fullname, image: userImage)
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        tableView.tableHeaderView = header
    }
    
    private func configTableView() {
        models.append(Sections(options: [
            SettingOpetions(icon: Images.edityourProfile, title: "Edit Profile", handler: {
                let editProfileVC = EditProfileVC()
                editProfileVC.title = "Edit Profile"
                return self.navigationController?.pushViewController(editProfileVC, animated: true)
            }),
            SettingOpetions(icon: Images.userStatementIcon, title: "E-Statement", handler: {
                let eStatement = UserStatementVC(Transaction: self.eTrasactions)
                eStatement.title = "Statement"
                return self.navigationController?.pushViewController(eStatement, animated: true)
            }),
            SettingOpetions(icon: Images.changePassword, title: "Change Password", handler: {
                let eStatement = ChangePasswordVC()
                eStatement.title = "Change"
                return self.navigationController?.pushViewController(eStatement, animated: true)
            }),
        ]))
        
        models.append(Sections(options: [
            SettingOpetions(icon: Images.aboutUs, title: "About us", handler: {
                let eStatement = AboutUsVC()
                eStatement.title = "About us"
                return self.navigationController?.pushViewController(eStatement, animated: true)
            }),
            SettingOpetions(icon: Images.logout, title: "Logout", handler: {
                let ac = UIAlertController(title: "Are sure you want Logout?", message: nil, preferredStyle: .actionSheet)
                for i in logoutOptions.allCases {
                    ac.addAction(UIAlertAction(title: "\(i)", style: .default, handler: self.didTapLogout(action:)))
                }
                return self.present(ac, animated: true, completion: nil)
            })
        ]))
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func didTapLogout(action: UIAlertAction) {
        showLoadingview()
        guard let actionTitle = action.title else { return }
        if actionTitle == "logout" {
            let ac =  UIAlertController(title: "Sing Out", message: "Are you sure?", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in self.dismissLoding()}))
            ac.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { [unowned self] _ in
                let logout = AuthManager.shared.SingOut()
                if logout {
                    DispatchQueue.main.async {
                        let LoginScreen = LoginVC()
                        LoginScreen.modalTransitionStyle = .crossDissolve
                        LoginScreen.modalPresentationStyle = .fullScreen
                        self.present(LoginScreen, animated: true)
                        self.dismissLoding()
                    }
                }
            }))
            present(ac, animated: true, completion: nil)
        } else if actionTitle == "cancel" {
            let ac =  UIAlertController(title: nil, message: "Are you sure?", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            present(ac, animated: true, completion: nil)
            self.dismissLoding()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = model.title
        content.image = model.icon
        content.imageProperties.tintColor = .systemBlue
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
    }

}


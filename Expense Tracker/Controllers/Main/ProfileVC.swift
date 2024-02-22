//
//  ProfileVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/27/22.
//
// UI DESING

import UIKit
import LocalAuthentication

// MARK: - Sections
private struct Sections {
    let options: [SettingOpetions]
}

private struct SettingOpetions {
    let icon: UIImage?
    let title: String
    let handler: () -> Void?
    
}

class ProfileVC: DataLoadingVC, UITableViewDelegate, UITableViewDataSource {
    
    private let faceIdSwitch = UISwitch()
    
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
                let userStagement = UserStatementVC(Transaction: self.eTrasactions)
                userStagement.title = "Statement"
                return self.navigationController?.pushViewController(userStagement, animated: true)
            }),
            SettingOpetions(icon: Images.changePassword, title: "Change Password", handler: {
                let changePass = ChangePasswordVC()
                changePass.title = "Change"
                return self.navigationController?.pushViewController(changePass, animated: true)
            }),
        ]))
        
        models.append(Sections(options: [
            SettingOpetions(icon: Images.enableAuth, title: "Enable Auth", handler: { })
        ]))
        
        models.append(Sections(options: [
            SettingOpetions(icon: Images.aboutUs, title: "About us", handler: {
                let aboutUs = AboutUsVC()
                aboutUs.title = "About us"
                return self.navigationController?.pushViewController(aboutUs, animated: true)
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
        showLoadingView()
        guard let actionTitle = action.title else { return }
        if actionTitle == "logout" {
            let ac =  UIAlertController(title: "Sing Out", message: "Are you sure?", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in self.dismissLoadingView()}))
            ac.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { [unowned self] _ in
                let logout = AuthManager.shared.SingOut()
                if logout {
                    DispatchQueue.main.async {
                        let LoginScreen = LoginVC()
                        LoginScreen.modalTransitionStyle = .crossDissolve
                        LoginScreen.modalPresentationStyle = .fullScreen
                        self.present(LoginScreen, animated: true)
                        self.dismissLoadingView()
                    }
                }
            }))
            present(ac, animated: true, completion: nil)
        } else if actionTitle == "cancel" {
            let ac =  UIAlertController(title: nil, message: "Are you sure?", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            present(ac, animated: true, completion: nil)
            self.dismissLoadingView()
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
        
        // Assign a new UISwitch to the cell's accessoryView only for the "Enable Auth" option
        if model.title == "Enable Auth" {
            // Create a new UISwitch for the Face ID cell
            let faceIdSwitch = UISwitch()
            faceIdSwitch.isOn = UserDefaults.standard.bool(forKey: "isFaceIDEnabled")
            faceIdSwitch.addTarget(self, action: #selector(faceIdSwitchChanged(_:)), for: .valueChanged)
            cell.accessoryView = faceIdSwitch
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
    }
    
    // This method toggles Face ID authentication and is called when the UISwitch is toggled
    @objc func faceIdSwitchChanged(_ sender: UISwitch) {
        if sender.isOn {
            // When turning on, authenticate with Face ID
            authenticateWithFaceID(sender: sender)
            debugPrint("Making On")
        } else {
            // When turning off, directly update UserDefaults and do not authenticate
            UserDefaults.standard.set(false, forKey: "isFaceIDEnabled")
            debugPrint("Truning off")
        }
    }

    
    func authenticateWithFaceID(sender: UISwitch) {
        let context = LAContext()
        var error: NSError?
        
        // Ensure Face ID is available before proceeding
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            // Directly reflect the OFF state in UserDefaults and update the switch UI
            DispatchQueue.main.async {
                sender.setOn(false, animated: true)
                UserDefaults.standard.set(false, forKey: "isFaceIDEnabled")
                debugPrint("Making One")
                // Optionally, handle the error and inform the user
            }
            return
        }
        
        // Authenticate using Face ID
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Enable Face ID") { success, evaluateError in
            DispatchQueue.main.async {
                if success {
                    // Authentication was successful, reflect this in UserDefaults
                    UserDefaults.standard.set(true, forKey: "isFaceIDEnabled")
                    debugPrint("Enabled")
                } else {
                    // Authentication failed, revert the UISwitch state and update UserDefaults
                    sender.setOn(false, animated: true)
                    UserDefaults.standard.set(false, forKey: "isFaceIDEnabled")
                    debugPrint("Disbaled")
                    // Optionally, handle the error and inform the user
                }
            }
        }
    }
    
}


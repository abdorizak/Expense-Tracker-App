//
//  ProfileVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/27/22.
//

import UIKit

// MARK: - Sections
struct Sections {
    let options: [SettingOpetions]
}

struct SettingOpetions {
    let title: String
    let handler: (() -> Void)?
}

class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let test = ["Item 1", "Item 1", "Item 1", "Item 1", "Item 1"]

    var models: [Sections] = []
    
    // MARK: - TableView
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configProfileVC()
        configTableView()
        setupTableHeaderView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configProfileVC() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        title = "Profile"
    }
    
    private func setupTableHeaderView() {
        let header = ProfileHeaderView(frame: .zero)
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        tableView.tableHeaderView = header
    }
    
    private func configTableView() {
        models.append(Sections(options: [
            SettingOpetions(title: "Edit Profile", handler: nil),
            SettingOpetions(title: "E-Statement", handler: nil),
            SettingOpetions(title: "Change Password", handler: nil),
        ]))
        
        models.append(Sections(options: [
            SettingOpetions(title: "TestOne", handler: nil),
            SettingOpetions(title: "TestOne", handler: nil),
            SettingOpetions(title: "TestOne", handler: nil),
            SettingOpetions(title: "TestOne", handler: nil)
        ]))
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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
        content.image = UIImage(systemName: "house")
        content.imageProperties.tintColor = .systemBlue
        cell.contentConfiguration = content
        return cell
    }

}


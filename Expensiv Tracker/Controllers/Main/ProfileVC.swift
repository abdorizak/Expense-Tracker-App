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
    }
    
    private func configProfileVC() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Profile"
        
    }
    
    private func configTableView() {
        models.append(Sections(options: [
            SettingOpetions(title: "TestOne", handler: nil),
            SettingOpetions(title: "TestOne", handler: nil),
            SettingOpetions(title: "TestOne", handler: nil),
            SettingOpetions(title: "TestOne", handler: nil)
        ]))
        
        models.append(Sections(options: [
            SettingOpetions(title: "TestOne", handler: nil),
            SettingOpetions(title: "TestOne", handler: nil)
        ]))
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "View"
//    }
    
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 90
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let v = UIView(frame: .zero)
//        v.backgroundColor = .clear
//        return v
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = model.title
        cell.textLabel?.font = UIFont.systemFont(ofSize: 22)
            return cell
    }

}


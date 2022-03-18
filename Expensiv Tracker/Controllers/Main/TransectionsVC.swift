//
//  TransectionsVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/3/22.
//

import UIKit

class TransectionsVC: UIViewController {
    
    lazy var segment: UISegmentedControl = {
        let items = ["Income", "Expenses"]
        let segment = UISegmentedControl(items: items)
        segment.selectedSegmentIndex = 0
        let font = UIFont.systemFont(ofSize: 18)
        segment.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.backgroundColor  = .tertiarySystemBackground
        segment.addTarget(self, action: #selector(siutDidChange(_:)), for: .valueChanged)
        segment.layer.cornerRadius = 15
        return segment
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configTransectionsVC()
        configSegment()
    }
    
    
    private func configTransectionsVC() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Transections"
        navigationItem.largeTitleDisplayMode  = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubViews(segment)
    }
    
    @objc func siutDidChange(_ segmentController: UISegmentedControl) {
        switch segmentController.selectedSegmentIndex {
        case 0:
            print("Tapped")
        case 1:
            print("Tapped..")
        default: break
            
        }
    }
    
    private func configSegment() {
        
        NSLayoutConstraint.activate([
            segment.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            segment.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            segment.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            segment.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
}

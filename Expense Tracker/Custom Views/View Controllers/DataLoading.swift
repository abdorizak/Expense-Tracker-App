//
// DataLoading.swift
// Expense Tracker
//
// Created by Abdirizak Hassan on 10/22/23. 💻
// Copyright © 2023 Abdirizak Hassan DR X. All Rights Reserved.
//
// GitHub: https://github.com/abdorizak
// Website: https://abdorizak.dev


import UIKit

class DataLoadingVC: UIViewController {
    
    var containerView: UIView!
    var loadingView: UIView!


    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor   = .systemBackground
        containerView.alpha             = 0
        
        UIView.animate(withDuration: 0.25) { self.containerView.alpha = 0.8 }
        
        // Create a rectangular loading view
        loadingView = UIView()
        loadingView.backgroundColor = .secondarySystemBackground
        loadingView.layer.cornerRadius = 15
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(loadingView)
        
        // Set constraints for the loading view
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            loadingView.widthAnchor.constraint(equalToConstant: 90),
            loadingView.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        loadingView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            if let containerView = self.containerView {
                containerView.removeFromSuperview()
                self.containerView = nil
            }
        }
    }

    
}

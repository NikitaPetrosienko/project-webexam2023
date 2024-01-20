//
//  SettingsViewController.swift
//  FirstApp
//
//  Created by Петросиенко Никита on 21.12.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    var logoutButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        navigationItem.title = "Settings⚙️"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureButton()
    }
    
    func configureButton() {
        view.addSubview(logoutButton)
        
        setButton()
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        setupConstraintsForLogoutButton()
    }
    
    func setButton() {
        logoutButton.setTitle("Log Out", for: .normal)
        logoutButton.tintColor = .white
        logoutButton.backgroundColor = .systemBlue
        logoutButton.layer.cornerRadius = 12.0
    }
    
    func setupConstraintsForLogoutButton() {
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            logoutButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}

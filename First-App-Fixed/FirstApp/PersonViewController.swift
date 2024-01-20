//
//  PersonViewController.swift
//  FirstApp
//
//  Created by Петросиенко Никита on 21.12.2023.
//

import UIKit

class PersonViewController: UIViewController {

    var redBackgroundView: UIView = UIView()
    var titleLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        navigationItem.title = "Profile👤"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureRedBackgroundView()
        configureTitleLabel()
    }
    
    // RED BACKGROUND VIEW
    func configureRedBackgroundView() {
        view.addSubview(redBackgroundView)
        
        setupRedBackgroundView()
        
        redBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraintsForRedBackgroundView()
    }
    
    func setupRedBackgroundView() {
        redBackgroundView.backgroundColor = .systemRed.withAlphaComponent(0.7)
        redBackgroundView.layer.cornerRadius = 12.0
    }
    
    func setupConstraintsForRedBackgroundView() {
        NSLayoutConstraint.activate([
            redBackgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            redBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            redBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            redBackgroundView.heightAnchor.constraint(equalToConstant: 88)
        ])
    }
    
    // TITLE LABEL
    func configureTitleLabel() {
        redBackgroundView.addSubview(titleLabel)
        
        setupTitleLabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        setupConstraintsForTitleLabel()
    }
    
    func setupTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.text = "Hello, Joe!"
        titleLabel.font = .systemFont(ofSize: 48, weight: .bold)
        titleLabel.textColor = .white
    }
    
    func setupConstraintsForTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: redBackgroundView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: redBackgroundView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: redBackgroundView.trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: redBackgroundView.bottomAnchor, constant: -20)
        ])
    }
}

//
//  ForecastTableViewCell.swift
//  FirstApp
//
//  Created by Петросиенко Никита on 21.12.2023.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ForecastTableViewCell"
    
    var titleView: UILabel = UILabel()
    var forecastView: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        backgroundView = UIView()
        backgroundView?.backgroundColor = .red.withAlphaComponent(0.3)
        backgroundView?.layer.cornerRadius = 15
        backgroundView?.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleView)
        addSubview(forecastView)
        
        setTitleParams()
        setForecastParams()
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(title: String, forecast: String, emoji: String = "🌤️") {
        titleView.text = title
        forecastView.text = forecast
    }
    
    func setTitleParams() {
        titleView.numberOfLines = 0
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.font = .systemFont(ofSize: 22, weight: .bold)
    }
    
    func setForecastParams() {
        forecastView.numberOfLines = 0
        forecastView.translatesAutoresizingMaskIntoConstraints = false
        forecastView.font = .systemFont(ofSize: 16, weight: .heavy)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleView.heightAnchor.constraint(equalToConstant: 22),
            titleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            forecastView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            forecastView.heightAnchor.constraint(equalToConstant: 22),
            forecastView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        if let backgroundView {
            NSLayoutConstraint.activate([
                backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            ])
        }
    }
    
}

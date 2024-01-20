//
//  ForecastDetailTableViewCell.swift
//  FirstApp
//
//  Created by Петросиенко Никита on 21.12.2023.
//

import UIKit

class ForecastDetailTableViewCell: UITableViewCell {

    static let reuseIdentifier = "ForecastDetailTableViewCell"
    
    var titleView: UILabel = UILabel()
    var forecastData: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleView)
        addSubview(forecastData)
        
        setTitleParams()
        setForecastDataParams()
        
        setupConstraints()
    }
    
    func set(title: String, forecast: String) {
        titleView.text = title
        forecastData.text = forecast
    }
    
    func setTitleParams() {
        titleView.numberOfLines = 0
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.font = .systemFont(ofSize: 22, weight: .heavy)
    }
    
    func setForecastDataParams() {
        forecastData.numberOfLines = 0
        forecastData.translatesAutoresizingMaskIntoConstraints = false
        forecastData.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleView.heightAnchor.constraint(equalToConstant: 22),
            
            forecastData.centerYAnchor.constraint(equalTo: centerYAnchor),
            forecastData.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            forecastData.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


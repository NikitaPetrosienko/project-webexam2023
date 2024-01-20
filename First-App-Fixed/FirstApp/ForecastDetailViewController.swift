//
//  ForecastDetailViewController.swift
//  FirstApp
//
//  Created by Петросиенко Никита on 21.12.2023.
//

import UIKit

class ForecastDetailViewController: UIViewController {

    let forecast: Forecast
    
    var forecastDetailTableView: UITableView = UITableView(frame: .zero, style: .insetGrouped)
    
    init(forecast: Forecast) {
        self.forecast = forecast
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = forecast.city
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemGray5
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(forecastDetailTableView)
        
        forecastDetailTableView.rowHeight = 50
        forecastDetailTableView.backgroundColor = .clear
        
        setTableViewDelegates()
        
        forecastDetailTableView.register(ForecastDetailTableViewCell.self, forCellReuseIdentifier: ForecastDetailTableViewCell.reuseIdentifier)
        
        forecastDetailTableView.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsForTableView()
    }
    
    func setConstraintsForTableView() {
        NSLayoutConstraint.activate([
            forecastDetailTableView.topAnchor.constraint(equalTo: view.topAnchor),
            forecastDetailTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            forecastDetailTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            forecastDetailTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setTableViewDelegates() {
        self.forecastDetailTableView.delegate = self
        self.forecastDetailTableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ForecastDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast.fiveDaysForecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let forecast = forecast.fiveDaysForecast[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ForecastDetailTableViewCell.reuseIdentifier) as! ForecastDetailTableViewCell
        cell.set(title: getDayAdding(daysCount: indexPath.row), forecast: forecast)
        return cell
    }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

func getDayAdding(daysCount: Int = 0) -> String {
    let calendar = Calendar.current
    guard let weekday = calendar.dateComponents([.weekday], from: Date.now + TimeInterval(daysCount * 60*60*24)).weekday else {
        return "Mon"
    }
    let weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    return weekdays[weekday-1]
}

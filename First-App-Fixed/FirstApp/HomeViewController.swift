//
//  HomeViewController.swift
//  FirstApp
//
//  Created by Петросиенко Никита on 21.12.2023.
//

import UIKit

class HomeViewController: UIViewController {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return refreshControl
    }()
    
    let cities = [
        "Moscow", "Petersburg" /*Error Name)*/, "Berlin", "London", "Paris", "Madrid", "Rome",
        // ... Can be new city
    ]
    
    var weatherData: [String: WeatherModel] = [:]
    
    let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        refreshData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        refreshData()
    }

    func setupUI() {
        // Navigation Bar + Background
        title = "Cities 🏢"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
    
    // MARK: Weather
    func fetchWeatherDetails(for city: String, completion: @escaping () -> ()) {
        Task {
            do {
                let data = try await networkManager.fetchWeatherData(for: city)
                let weatherModel = try JSONDecoder().decode(WeatherModel.self, from: data)
                weatherData[city] = weatherModel
                completion()
            } catch {
                print("Error fetching or decoding weather data: \(error.localizedDescription)")
                completion()
            }
        }
    }
    
    func updateUI() {
            self.tableView.rowHeight = 100
            self.view.addSubview(self.tableView)
            self.tableView.delegate = self
            self.tableView.dataSource = self
            //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CityCell")
            self.tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: ForecastTableViewCell.reuseIdentifier)
            
            // Refresh
            self.tableView.addSubview(self.refreshControl)
            
            NSLayoutConstraint.activate([
                self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
                self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
           self.tableView.reloadData()
            self.refreshControl.endRefreshing()
    }
    
    @objc func refreshData() {
        for city in cities {
            fetchWeatherDetails(for: city) { [weak self] in
                self?.updateUI()
            }
        }
        
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
        }
    }
}

// MARK: - TableView Delegates
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ForecastTableViewCell(style: .default, reuseIdentifier: "WeatherCell") as ForecastTableViewCell
        
        let city = cities[indexPath.row]
        
        if let currentWeather = weatherData[city] {
            let regionName = currentWeather.location.name
            let temperature = currentWeather.current.tempC
            let conditionIconURL = "https:" + currentWeather.current.condition.icon
            
            cell.titleView.text = regionName
            
            if let url = URL(string: conditionIconURL) {
                Task {
                    do {
                        let (data, _) = try await URLSession.shared.data(from: url)
                        if let image = UIImage(data: data) {
                            // Create Attachment
                            let attachment = NSTextAttachment()
                            attachment.image = image
                            let attachmentString = NSAttributedString(attachment: attachment)
                            let myString = NSMutableAttributedString(string: "")
                            myString.append(attachmentString)
                            cell.forecastView.attributedText = myString
                        }
                    } catch {
                        print("Error downloading icon image: \(error.localizedDescription)")
                    }
                }
            }
            
            cell.titleView.text! += "   \(temperature)°C"
            
         } else {
            cell.titleView.text = city
            cell.forecastView.text = "no search..."
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let selectedForecast = LocalData.shared.forecast[indexPath.row]
        navigationController?.pushViewController(ForecastDetailViewController(forecast: selectedForecast), animated: true)
    }
}

//
//  Forecast.swift
//  FirstApp
//
//  Created by Петросиенко Никита on 21.12.2023.
//

import Foundation

struct Forecast {
    let city: String
    let fiveDaysForecast: [String]
}

class LocalData {
    static let shared = LocalData()
    var forecast: [Forecast] = [
        .init(city: "Moscow", fiveDaysForecast: [
            "+3 ☁️",
            "+3 ☁️",
            "+1 ❄️",
            "0 ☁️",
            "1 ☁️"
        ]),
        .init(city: "Saint Petersburg", fiveDaysForecast: [
            "+4 💨",
            "+1 💨",
            "+1 ☁️",
            "+1 ❄️",
            "+1 ❄️"
        ]),
        .init(city: "Berlin", fiveDaysForecast: [
            "+7 🌧️",
            "+7 🌧️",
            "+9 🌧️",
            "+5 🌧️",
            "+6 🌧️"
        ]),
        .init(city: "London", fiveDaysForecast: [
            "+13 ☁️",
            "+11 ☁️",
            "+13 💨",
            "+11 ☁️",
            "+12 ☁️"
        ]),
        .init(city: "Paris", fiveDaysForecast: [
            "+10 🌧️",
            "+9 ☁️",
            "+12 ☁️",
            "+12 💨",
            "+11 ☁️"
        ]),
        .init(city: "Madrid", fiveDaysForecast: [
            "+12 ☀️",
            "+11 🌤️",
            "+11 ☀️",
            "+12 ☀️",
            "+12 ☀️"
        ]),
        .init(city: "Rome", fiveDaysForecast: [
            "+15 ☀️",
            "+14 ☁️",
            "+14 ☀️",
            "+15 🌤️",
            "+15 ☀️"
        ])
    ]
}

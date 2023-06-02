//
//  WeatherModel.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

struct WeatherModel: Codable {
    let lat: Double
    let lon: Double
    let current: Current
}

struct Current: Codable {
    let sunrise: Double
    let sunset: Double
    let temp: Double
    let feelsLike: Double
    let humidity: Double
    let uvi: Double
    let clouds: Double
    let visibility: Int
    let wind_speed: Double
    let weather: [Weather]

    private enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset
        case temp
        case feelsLike = "feels_like"
        case humidity
        case uvi
        case clouds
        case visibility
        case wind_speed
        case weather
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

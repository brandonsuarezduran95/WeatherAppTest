//
//  WeatherController + transformData.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

extension WeatherViewController {
    
    func transformData(weatherData: WeatherModel?) -> (sunrise: String, sunset: String, temperature: String, feelsLike: String, humidity: String, cloudPercentage: String, windSpeed: String) {
        
        guard let weather = weatherData else { return ("", "", "", "", "", "", "") }
        
        //date Formatter components
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.timeZone = .current
        
        // Sunrise
        let sunrise = weather.current.sunrise
        let sunriseDate = "Sunrise: \(dateFormatter.string(from: Date(timeIntervalSince1970: sunrise)))"
        
        // Sunset
        let sunset = weather.current.sunset
        let sunsetDate = "Sunset: \(dateFormatter.string(from: Date(timeIntervalSince1970: sunset)))"
        
        // temperatur
        let temperature = "Temperature: \(convertKelvinToFahrenheit(kelvin: weather.current.temp)) F"
        
        // feels like
        let feelsLike = "Feels Like: \(convertKelvinToFahrenheit(kelvin: weather.current.feelsLike)) F"
        
        // humidity
        let humidity = "Humidity: \(weather.current.humidity) %"
        
        // cloud percentage
        let cloudPercentage = "Cloudiness: \(weather.current.clouds) %"
        
        // windSpeed
        let windSpeed = "Wind Speed: \(weather.current.wind_speed) m/s"
        
        return (sunriseDate, sunsetDate, temperature, feelsLike, humidity, cloudPercentage, windSpeed)
    }
    
}


extension WeatherViewController {
    // From kelvin to Fahrenheit
    func convertKelvinToFahrenheit(kelvin: Double) -> Double {
        let fahrenheit = (kelvin * 9/5) - 459.67
        let result = Double(String(format: "%.2f", fahrenheit)) ?? 0.0
        return result
    }
    
}

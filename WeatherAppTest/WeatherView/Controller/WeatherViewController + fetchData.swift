//
//  WeatherViewController + fetchData.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

extension WeatherViewController {
    
    func fetchData() {
        NetworkService().fetchWeatherData(searchTerm: geoCode) { result in
            switch result {
            case .success(let weatherData):
                DispatchQueue.main.async {
                    self.weather = weatherData
                    print(weatherData)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

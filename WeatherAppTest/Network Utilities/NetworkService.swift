//
//  NetworkService.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

// The Network Service class will help fetching from both APIs
class NetworkService {
    
    // Fetch from the GeoCode API
    func fetchCityData(searchTerm: String, completion: @escaping (Result<[GeoCodingModel], NetworkError>) -> Void) {
        guard let url = URL(string: "http://api.openweathermap.org/geo/1.0/direct?q=\(searchTerm)&limit=0&appid=\(Keys.API)") else {
            return completion(.failure(.badURL))
        }
        NetworkManager().fetchRequest(type: [GeoCodingModel].self, url: url, completion: completion)
    }
    
    // fetch city by coordinates
    func fetchCityByCoordinates(latitude: Double, longitude: Double, completion: @escaping (Result<[GeoCodingModel], NetworkError>) -> Void ) {
        guard let url = URL(string: "http://api.openweathermap.org/geo/1.0/reverse?lat=\(latitude)&lon=\(longitude)&limit=5&appid=\(Keys.API)") else {
            return completion(.failure(.badURL))
        }
        
        NetworkManager().fetchRequest(type: [GeoCodingModel].self, url: url, completion: completion)
    }
    
    // Fetch from the Weather API
    func fetchWeatherData(searchTerm: GeoCodingModel ,completion: @escaping (Result<WeatherModel, NetworkError>)-> Void) {
        let lat = searchTerm.lat
        let lon = searchTerm.lon
        
        guard let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely,hourly,daily,alerts&appid=\(Keys.API)") else {
            return completion(.failure(.badURL))
        }

        NetworkManager().fetchRequest(type: WeatherModel.self, url: url, completion: completion)
    }
    
    // Fetch from image API
    
    func fetchImageData(searchTerm: String, completion: @escaping (UIImage?) -> Void ) {
        
        guard let url = URL(string: "https://openweathermap.org/img/wn/\(searchTerm)@2x.png") else { return }
        NetworkManager().downloadImage(from: url, completion: completion)
    }
}

//
//  ViewController + fetchCurrentLocationData.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

extension ViewController {
    
    func fetchCurrentLocationData(latitude: Double, longitude: Double ) {
        NetworkService().fetchCityByCoordinates(latitude: latitude, longitude: longitude) { result in
            switch result {
            case .success(let currentLocationData):
                DispatchQueue.main.async {
                    self.geoCodes = currentLocationData
                    self.tableView.reloadData()
                    print(currentLocationData)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

//
//  ViewController + getLastSearch.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

extension ViewController {
    
    func getLastSearch() {
        if let lastSearch = defaults.object(forKey: Keys.lastSearchKey) as? Data {
            let decoder = JSONDecoder()
            if let loadLastSearch = try? decoder.decode(GeoCodingModel.self, from: lastSearch) {
                self.geoCodes = [loadLastSearch]
            }
        }
    }
    
}

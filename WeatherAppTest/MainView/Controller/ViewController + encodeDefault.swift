//
//  ViewController + encodeObject.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

extension ViewController {
    
    func encodeObject(object: GeoCodingModel) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            defaults.set(encoded, forKey: Keys.lastSearchKey)
        }
    }
}

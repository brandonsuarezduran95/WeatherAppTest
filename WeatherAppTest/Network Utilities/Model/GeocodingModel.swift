//
//  GeocodingModel.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

struct GeoCodingModel: Codable, Hashable {
    let name: String
    let lat: Double
    let lon: Double
    let country: String
}

extension GeoCodingModel: Equatable {
    
    static func ==(lhs: GeoCodingModel, rhs: GeoCodingModel) -> Bool {
        return lhs.name == rhs.name && lhs.country == rhs.country
    }
    
}

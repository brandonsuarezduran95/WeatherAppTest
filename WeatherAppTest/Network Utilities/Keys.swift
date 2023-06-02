//
//  Keys.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

// Singleton for the API Key

struct Keys {
    static let API = "1e3283f40fb28be6dade86782dc58f51"
    static let lastSearchKey = "lastSearchKey"
    static let locationGranted = "LocationGranted"
    private init() {}
}

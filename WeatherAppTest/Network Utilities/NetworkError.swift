//
//  NetworkError.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

enum NetworkError: String, Error {
    case badURL
    case badServerResponse
    case noData
    case decodingError
}


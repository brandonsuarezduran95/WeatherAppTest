//
//  WeatherViewController + loadImage.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

extension WeatherViewController {
    
    func loadImage() {
        guard let searchTerm = weather?.current.weather.first?.icon else { return }
        NetworkService().fetchImageData(searchTerm: searchTerm) { image in
            if let image = image {
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            } else {
                print("No image found")
            }
        }
    }
    
}

//
//  WeatherViewController + ImageView.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

extension WeatherViewController {
    func setUpImageView() {
        // adding to hierarchy
        view.addSubview(imageView)
        
        // constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -230),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

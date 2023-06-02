//
//  ViewController + cleanSearchQuery.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import Foundation

extension ViewController {
    
    func cleanSearchQuery() {
        self.geoCodes = []
        self.tableView.reloadData()
    }
}

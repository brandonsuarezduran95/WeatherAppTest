//
//  ViewController + FilterData.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

extension ViewController {
    
    func filterRepeatedData() {
        
        if geoCodes.count < 1 {
            return
        }
        
        var filteredData: [GeoCodingModel] = []
        
        for element in geoCodes {
            if !filteredData.contains(element) {
                filteredData.append(element)
            }
        }
        geoCodes = filteredData
        tableView.reloadData()
    }
}

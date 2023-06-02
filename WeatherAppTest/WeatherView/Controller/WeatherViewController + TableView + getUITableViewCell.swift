//
//  WeatherViewController + TableView + getUITableViewCell.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

extension WeatherViewController {
    
    func getUITableViewCell(onItemForRow at: Int) -> UITableViewCell {
        let weatherData = transformData(weatherData: weather)
        
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        switch at {
        case 0:
            cell.textLabel?.text = weatherData.temperature
        case 1:
            cell.textLabel?.text = weatherData.feelsLike
        case 2:
            cell.textLabel?.text = weatherData.humidity
        case 3:
            cell.textLabel?.text = weatherData.sunset
        case 4:
            cell.textLabel?.text = weatherData.sunrise
        case 5:
            cell.textLabel?.text = weatherData.cloudPercentage
        case 6:
            cell.textLabel?.text = weatherData.windSpeed
        default:
            break
        }
        return cell
    }
    
}

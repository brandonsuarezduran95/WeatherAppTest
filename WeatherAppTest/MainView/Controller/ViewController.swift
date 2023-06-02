//
//  ViewController.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/1/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    // UI Elements
    let tableView = UITableView()
    let searchBar = UISearchBar()
    
    // Variables
    var geoCodes: [GeoCodingModel] = []
    
    // location manager
    var locationManager = CLLocationManager()
    
    // user default
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpSearchBar()
        getLastSearch()
        setUpTableView()
        requestLocation()
    }
    // setup
    private func setUp() {
        // Setting the initial view
        title = "Weather App"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        view.applyGradientBackground(colors: [UIColor.systemBlue, UIColor.white], startPoint: CGPoint(x: 0.0, y: 0.0), endPoint: CGPoint(x: 1.0, y: 1.0))
    }
}


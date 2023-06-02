//
//  WeatherViewController.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

class WeatherViewController: UIViewController {
    // constants
    let geoCode: GeoCodingModel
    
    // variables
    var weather: WeatherModel?
    
    // UI Elements
    let imageView = UIImageView()
    let tableView = UITableView()
    
    // Custom initializer
    init(geoCode: GeoCodingModel) {
        self.geoCode = geoCode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        fetchData()
        setUpImageView()
        setUpTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadImage() 
        tableView.reloadData()
    }
    
    // setup
    private func setUp() {
        // Setting the initial view
        title = geoCode.name
        navigationController?.navigationBar.prefersLargeTitles = true
        view.applyGradientBackground(colors: [UIColor.systemBlue, UIColor.white], startPoint: CGPoint(x: 0.0, y: 0.0), endPoint: CGPoint(x: 1.0, y: 1.0))
    }

}

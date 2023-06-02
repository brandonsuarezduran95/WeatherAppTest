//
//  WeatherViewController  + TableView.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

extension WeatherViewController {
    // setup TableView
    
    func setUpTableView() {
        // adding to hierarchy
        view.addSubview(tableView)
        
        // decorators
        tableView.backgroundColor = .clear
        
        // delegates
        tableView.dataSource = self
        tableView.delegate = self
        
        // constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}

extension WeatherViewController: UITableViewDelegate {
    
}

// MARK: Data Source

extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getUITableViewCell(onItemForRow: indexPath.row)
        
    }

}

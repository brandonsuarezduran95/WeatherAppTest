//
//  ViewController + TableView.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

extension ViewController {
    func setUpTableView() {
        // adding to view hierarchy
        view.addSubview(tableView)
        
        // Decorators
        tableView.backgroundColor = .clear
        
        // Delegates
        tableView.dataSource = self
        tableView.delegate = self
        
        // Constraints
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}

// MARK: Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // selected element
        let geoCode = geoCodes[indexPath.row]
        
        // saving to user defaults
        encodeObject(object: geoCode)
        
        // Weather view controller
        let weatherViewController = WeatherViewController(geoCode: geoCode)
        navigationController?.pushViewController(weatherViewController, animated: true)
        
    }
}

// MARK: Data Source
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        geoCodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let location = geoCodes[indexPath.row]
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        cell.textLabel?.text = "\(location.name), \(location.country)"
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }

}

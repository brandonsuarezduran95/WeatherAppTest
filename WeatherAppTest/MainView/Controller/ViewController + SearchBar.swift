//
//  ViewController + SearchBar.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

extension ViewController {
    
    // setup Search Bar
    func setUpSearchBar() {
        // adding to hierarchy
        view.addSubview(searchBar)
        
        // decorators
        searchBar.searchBarStyle = .minimal
        
        // Delegate
        searchBar.delegate = self
        
        // constrains
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: Delegate

extension ViewController: UISearchBarDelegate {
    
    // search as the user enters the text
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let searchTerm = searchText.replacingOccurrences(of: " ", with: "_")
        
        // Calling the GeoCode API
        NetworkService().fetchCityData(searchTerm: searchTerm) { result in
            switch result {
            case.success(let geoCodeData):
                DispatchQueue.main.async {
                    self.geoCodes = geoCodeData
                    self.filterRepeatedData()
                }
            case .failure(let error):
                print(error.rawValue)
            }
        }
        
        cleanSearchQuery()
    }
}

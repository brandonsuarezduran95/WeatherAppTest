//
//  ViewController + Location.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit
import MapKit

extension ViewController: CLLocationManagerDelegate {
    
    // request location
    func requestLocation() {
        let locationGranted = defaults.bool(forKey: Keys.locationGranted)
//        if !locationGranted {
            self.locationManager.requestWhenInUseAuthorization()
//        }
        
        // check if the user enabled user location or the
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() || locationGranted {
                //saving the authorization
                self.defaults.set(true, forKey: Keys.locationGranted)
                
                //setting up the delegates
                self.locationManager.delegate = self
                // setting up the accuracy
                self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
                // start updating location
                self.locationManager.startUpdatingLocation()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let locationValue:CLLocationCoordinate2D = manager.location!.coordinate
        let latitude = locationValue.latitude
        let longitude = locationValue.longitude
        
        print("locations = last: \(latitude), lon: \(longitude)")
        
        fetchCurrentLocationData(latitude: latitude, longitude: longitude)
    }
}


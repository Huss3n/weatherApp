//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Muktar Hussein on 23/11/2022.
//

import Foundation
import CoreLocation

// create locaion manager class

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        // set the manager as the delegate
        manager.delegate = self
    }
    
    func requestUserLocation(){
        //        isLoading.toggle()
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // assign the location variable
        location = locations.first?.coordinate
        isLoading = false // because we got the location
    }
    
     // handle the error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
    
    // getting core location in the back ground 
}

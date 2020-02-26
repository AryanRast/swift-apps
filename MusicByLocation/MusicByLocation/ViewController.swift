//
//  ViewController.swift
//  MusicByLocation
//
//  Created by Rastogi, Aryan (WING) on 26/02/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()

    @IBOutlet var musicRecommendations: UILabel!
    
    
    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.musicRecommendations.text = firstLocation.coordinate.latitude.description
                } else {
                    self.musicRecommendations.text = " You are in \(String(describing: placemarks?[0].locality)). Your exact location is \(String(describing: placemarks?[0].subLocality))"
                }
            })
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not acces user's location Error: \(error.localizedDescription)"
    }


}


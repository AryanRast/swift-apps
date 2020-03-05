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
    let iTunesAdaptor = ITunesAdaptor()
    let locationMangerDelegate = LocationManagerDelegate()

    @IBOutlet var musicRecommendations: UILabel!
    
    
    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    
    }
    
    func updateDisplay(text: String?) {
        
        musicRecommendations.text = text
    }
    func updateArtistsByLocation(text: String?) {
        iTunesAdaptor.getArtists(search: text) { (artists) in
            let names = artists?.map { return $0.artistName }
            self.musicRecommendations.text = names?.joined(separator: ", ")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = locationMangerDelegate
        locationMangerDelegate.vc = self
    
    }
    
    


}


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
                    self.getArtists(term: placemarks![0].locality!)
                }
            })
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not acces user's location Error: \(error.localizedDescription)"
    }
    
    func getArtists(term: String?) -> String {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(term)&entity=musicArtist")
            else {
                print("invalid URL")
                return "invalid URL. Wasn't able to search itunes"
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    let names = response.results.map {
                        return $0.artistName
                    }
                    DispatchQueue.main.async {
                        self.musicRecommendations.text = names.joined(separator: ", ")
                                    
                    }
                    
                }
            }
        } .resume()
        
        return ""
    }
    
    func parseJson(json: Data) -> ArtistResponse? {
        let decoder = JSONDecoder()
        
        
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("Failed to decode to artist response")
            return nil
        }
        
    }


}

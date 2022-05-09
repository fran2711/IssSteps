//
//  SplashViewController.swift
//  Xfera
//
//  Created by Francisco Lucena on 9/5/22.
//  Copyright © 2020 Xfera Consumer Finance EFC SA. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation


class SplashViewController: BaseViewController {
    var presenter: SplashPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        
        getUserLocation()
    }
    
    func getUserLocation() {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestLocation()
        }
    }
}

extension SplashViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        let altitude = location.altitude
        print("location = latitude: \(latitude), longitude: \(longitude), altitude: \(altitude)")
        
        presenter.goToIssSteps(latitude: latitude, longitude: longitude, altitude: altitude)
        
    }
    
    func locationManager( _ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
        if manager.authorizationStatus != .denied {
            manager.requestLocation()
        } else {
            let alertController = UIAlertController(title: "Acceso a Localización", message: "Por favor, acpete permisos de locaclización", preferredStyle: .alert)
            
            let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in })
                }
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in
                
            }
            
            alertController.addAction(cancelAction)
            alertController.addAction(settingsAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

//----------------------------
// MARK: - Protocol
//----------------------------
extension SplashViewController: SplashViewProtocol{
    
}

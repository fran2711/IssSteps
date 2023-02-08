//
//  SplashPresenter.swift
//  Xfera
//
//  Created by Francisco Lucena on 9/5/22.
//  Copyright © 2020 Xfera Consumer Finance EFC SA. All rights reserved.
//

import Foundation
import UIKit

class SplashPresenter: BasePresenterProtocol {
    
    var view: SplashViewProtocol?
    var interactor: SplashInteractorProtocol?
    var router: SplashRouterProtocol?

}

extension SplashPresenter: SplashPresenterProtocol {

    func showLoading() {
    }
    
    func goToIssSteps(latitude: Double?, longitude: Double?, altitude: Double?) {
        var lat: Double = 40.3297
        var long: Double = -3.51694
        var alt: Double = 1
        if let latitude = latitude {
            lat = latitude
        }
        
        if let longitude = longitude {
            long = longitude
        }
        
        if let altitude = altitude {
            alt = altitude
        }
        
        let request = SpaceStationPredictionsRequest(latitude: lat, longitude: long, altitude: alt)
        router?.presentIssSteps(request: request)
    }
    
}


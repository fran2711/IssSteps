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
    
    func goToIssSteps(latitude: Double?, longitude: Double?, altitude: Double) {
        var lat: Double = 40.3297
        var long: Double = -3.51694
        if let latitude = latitude {
            lat = latitude
        }
        
        if let longitude = longitude {
            long = longitude
        }
        
        let request = SpaceStationPredictionsRequest(latitude: lat, longitude: long, altitude: altitude)
        router?.presentIssSteps(request: request)
    }
    
}


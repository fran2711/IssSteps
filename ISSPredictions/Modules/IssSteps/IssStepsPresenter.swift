//
//  IssStepsPresenter.swift
//  Xfera
//
//  Created by Francisco Lucena on 9/5/22.
//  Copyright © 2020 Xfera Consumer Finance EFC SA. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class IssStepsPresenter: BasePresenterProtocol {
    
    var view: IssStepsViewProtocol?
    var interactor: IssStepsInteractorProtocol?
    var router: IssStepsRouterProtocol?
    
    var request: SpaceStationPredictionsRequest
    var address: String?
    
    var steps: [IssStep] = []
    
    init(request: SpaceStationPredictionsRequest) {
        self.request = request
    }

    func viewDidAppear() {
        getSteps()
    }
    
    func getSteps() {
        view?.showLoading()
        interactor?.getIssSteps(request: request, onSuccess: { [weak self] response in
            self?.steps = response
            self?.getAddress()
        })
    }
    
    func getAddress() {
        var address: String = ""
        
        let latitude: Double = Double(request.latitude) ?? 0
        let longitude: Double = Double(request.longitude) ?? 0
        
        let location: CLLocation = CLLocation(latitude: latitude, longitude: longitude)
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            if error != nil {
                self?.view?.hideLoading()
                print(error?.localizedDescription)
                self?.view?.errorAlert(errorMessage: error?.localizedDescription ?? "", title: "Error")
            }
            
            guard let marks = placemarks else { return }
            
            if marks.count > 0 {
                let placemark = marks.last
                if let thoroughfare = placemark?.thoroughfare {
                    address.append(contentsOf: thoroughfare + ", ")
                }
                if let subThoroughfare = placemark?.subThoroughfare {
                    address.append(contentsOf: subThoroughfare + ", ")
                }
                if let locality = placemark?.locality {
                    address.append(contentsOf: locality  + ", ")
                }
                if let postalCode = placemark?.postalCode  {
                    address.append(contentsOf: postalCode + ", ")
                }
                if let country = placemark?.country {
                    address.append(contentsOf: country)
                }
                self?.address = address
                self?.updateView()
            }
        }
    }
    
    func updateView() {
        view?.hideLoading()
        view?.showSteps(steps: self.steps)
        view?.updateLocation(self.address ?? "")
    }

}

extension IssStepsPresenter: IssStepsPresenterProtocol {
    func selectedStep(_ step: IssStep) {
        router?.showStepDetail(step: step, address: self.address)
    }
}


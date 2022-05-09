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
    
    init(request: SpaceStationPredictionsRequest) {
        self.request = request
    }
    
    func viewDidLoad() {
       getSteps()
    }
    
    func getSteps() {
        interactor?.getIssSteps(request: request, onSuccess: { [weak self] response in
            self?.view?.showSteps(steps: response)
        })
    }

}

extension IssStepsPresenter: IssStepsPresenterProtocol {
    
}


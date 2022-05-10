//
//  IssStepsInteractor.swift
//  Xfera
//
//  Created by Francisco Lucena on 9/5/22.
//  Copyright © 2020 Xfera Consumer Finance EFC SA. All rights reserved.
//

import Foundation

class IssStepsInteractor : IssStepsInteractorProtocol {
    var presenter: IssStepsPresenterProtocol?
    
    func getIssSteps(request: SpaceStationPredictionsRequest, onSuccess: @escaping([IssStep]) -> ()) {
        SpaceStationPredictionsProvider().getSpaceStationPredictions(request: request) { response in
            guard let steps = response.response else { return }
            onSuccess(steps)
        } onError: { [weak self] error in
            self?.presenter?.hideLoading()
            self?.presenter?.showError(error.localizedDescription)
        }

    }
}

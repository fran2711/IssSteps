//
//  StepDetailInteractor.swift
//  Xfera
//
//  Created by Francisco Lucena on 9/5/22.
//  Copyright © 2020 Xfera Consumer Finance EFC SA. All rights reserved.
//

import Foundation

class StepDetailInteractor : StepDetailInteractorProtocol {
    var presenter: StepDetailPresenterProtocol?
    
    func getFacts(request: NumbersFactRequest, onSuccess: @escaping(String?) -> ()) {
        NumbersFactsProvider().getNumberFact(request: request) { [weak self] response in
            onSuccess(response?.text)
        } onError: { [weak self] error in
            self?.presenter?.hideLoading()
        }

    }
}

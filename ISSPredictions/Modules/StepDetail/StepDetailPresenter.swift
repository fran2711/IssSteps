//
//  StepDetailPresenter.swift
//  Xfera
//
//  Created by Francisco Lucena on 9/5/22.
//  Copyright © 2020 Xfera Consumer Finance EFC SA. All rights reserved.
//

import Foundation
import UIKit

class StepDetailPresenter: BasePresenterProtocol {
    
    var view: StepDetailViewProtocol?
    var interactor: StepDetailInteractorProtocol?
    var router: StepDetailRouterProtocol?
    
    var issStep: IssStep
    var address: String?
    
    init(issStep: IssStep, address: String?) {
        self.issStep = issStep
        self.address = address
    }
    
    func viewDidAppear() {
        getFact()
    }
    
    func getFact() {
        let request = NumbersFactRequest(number: issStep.duration ?? 0)
        view?.showLoading()
        interactor?.getFacts(request: request, onSuccess: { [weak self] fact in
            self?.view?.configureView(issStep: self?.issStep, fact: fact, address: self?.address)
        })
    }

}

extension StepDetailPresenter: StepDetailPresenterProtocol {
    
    func hideLoading() {
        view?.hideLoading()
    }
    
    func showError(_ error: String) {
        if let alert = view?.errorAlert(errorMessage: error, title: "Error") {
            let accept = UIAlertAction(title: "Acceptar", style: .default)
            let retry = UIAlertAction(title: "Reintentar", style: .default) { [weak self] _ in
                self?.getFact()
            }
            
            alert.addAction(accept)
            alert.addAction(retry)
            
            view?.showAlert(alert)
        }
    }
}


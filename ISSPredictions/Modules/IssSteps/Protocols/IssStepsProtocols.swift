//
//  IssStepsProtocols.swift
//  Xfera
//
//  Created by Francisco Lucena on 9/5/22.
//  Copyright © 2020 Xfera Consumer Finance EFC SA. All rights reserved.
//

import Foundation
import UIKit

//----------------------------
// MARK: - View
//----------------------------
protocol IssStepsViewProtocol: BaseViewProtocol {
    func showSteps(steps: [IssStep])
    func updateLocation(_ location: String)
}

//----------------------------
// MARK: - Interactor
//----------------------------
protocol IssStepsInteractorProtocol {
    var presenter: IssStepsPresenterProtocol? { get set }
    
    func getIssSteps(request: SpaceStationPredictionsRequest, onSuccess: @escaping([IssStep]) -> ())
}

//----------------------------
// MARK: - Presenter
//----------------------------
protocol IssStepsPresenterProtocol: BasePresenterProtocol {
    var view: IssStepsViewProtocol? { get set }
    var interactor: IssStepsInteractorProtocol? { get set }
    var router: IssStepsRouterProtocol? { get set }
    
    func selectedStep(_ step: IssStep)
    func showError(_ error: String)
    func hideLoading()
}

//----------------------------
// MARK: - Router
//----------------------------
protocol IssStepsRouterProtocol : BaseRouterProtocol {
    var view: IssStepsViewController? { get set }
    static func launchModule(request: SpaceStationPredictionsRequest) -> UIViewController?
    
    func showStepDetail(step: IssStep, address: String?)
}

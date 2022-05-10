//
//  SplashProtocols.swift
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
protocol SplashViewProtocol: BaseViewProtocol {
}

//----------------------------
// MARK: - Interactor
//----------------------------
protocol SplashInteractorProtocol {
    var presenter: SplashPresenterProtocol? { get set }
}

//----------------------------
// MARK: - Presenter
//----------------------------
protocol SplashPresenterProtocol: BasePresenterProtocol {
    var view: SplashViewProtocol? { get set }
    var interactor: SplashInteractorProtocol? { get set }
    var router: SplashRouterProtocol? { get set }
    
    func showLoading()
    func goToIssSteps(latitude: Double?, longitude: Double?, altitude: Double)
}

//----------------------------
// MARK: - Router
//----------------------------
protocol SplashRouterProtocol : BaseRouterProtocol {
    var view: SplashViewController? { get set }
    static func launchModule() -> UIViewController?
    
    func presentIssSteps(request: SpaceStationPredictionsRequest)
}

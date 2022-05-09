//
//  SplashRouter.swift
//  Xfera
//
//  Created by Francisco Lucena on 9/5/22.
//  Copyright © 2020 Xfera Consumer Finance EFC SA. All rights reserved.
//

import Foundation
import UIKit

class SplashRouter: BaseRouter, SplashRouterProtocol {

    var view: SplashViewController?
    
    //----------------------------
    // MARK: - Launcher Initializer
    //----------------------------
    @discardableResult
    static func launchModule() -> UIViewController? {
        if let view = StoryboardHandler.instantiateViewController(.splash) as? SplashViewController {
                    
            var interactor: SplashInteractorProtocol = SplashInteractor()
            let router: SplashRouterProtocol = SplashRouter()
            var presenter: SplashPresenterProtocol = SplashPresenter()

            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
                    
            return view
        }
        
        return nil
    }
    
    //----------------------------
    // MARK: - Navigation methods
    //----------------------------
    
    func presentIssSteps(request: SpaceStationPredictionsRequest){
        IssStepsRouter.launchModule(request: request)
    }
    
}

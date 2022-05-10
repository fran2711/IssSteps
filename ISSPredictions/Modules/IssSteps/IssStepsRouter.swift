//
//  IssStepsRouter.swift
//  Xfera
//
//  Created by Francisco Lucena on 9/5/22.
//  Copyright © 2020 Xfera Consumer Finance EFC SA. All rights reserved.
//

import Foundation
import UIKit

class IssStepsRouter: BaseRouter, IssStepsRouterProtocol {

    var view: IssStepsViewController?

    //----------------------------
    // MARK: - Launcher Initializer
    //----------------------------
    @discardableResult
    static func launchModule(request: SpaceStationPredictionsRequest) -> UIViewController? {
        if let view = StoryboardHandler.instantiateViewController(.issSteps) as? IssStepsViewController {
                    
            var interactor: IssStepsInteractorProtocol = IssStepsInteractor()
            var router: IssStepsRouterProtocol = IssStepsRouter()
            var presenter: IssStepsPresenterProtocol = IssStepsPresenter(request: request)

            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            router.view = view
            
            router.startNavigation(navigationType: .asRootWithNav, view: view, from: nil)
                    
            return view
        }
        
        return nil
    }
    
    //----------------------------
    // MARK: - Navigation methods
    //----------------------------
    
    func showStepDetail(step: IssStep, address: String?) {
        push(from: view, to: StepDetailRouter.launchModule(issStep: step, address: address))
    }
}

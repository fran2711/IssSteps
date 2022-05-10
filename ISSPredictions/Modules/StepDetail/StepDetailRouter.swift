//
//  StepDetailRouter.swift
//  Xfera
//
//  Created by Francisco Lucena on 9/5/22.
//  Copyright © 2020 Xfera Consumer Finance EFC SA. All rights reserved.
//

import Foundation
import UIKit

class StepDetailRouter: BaseRouter, StepDetailRouterProtocol {


    //----------------------------
    // MARK: - Launcher Initializer
    //----------------------------
    @discardableResult
    static func launchModule(issStep: IssStep, address: String?) -> UIViewController? {
        if let view = StoryboardHandler.instantiateViewController(.stepDetail) as? StepDetailViewController {
                    
            var interactor: StepDetailInteractorProtocol = StepDetailInteractor()
            let router: StepDetailRouterProtocol = StepDetailRouter()
            var presenter: StepDetailPresenterProtocol = StepDetailPresenter(issStep: issStep, address: address)

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
}

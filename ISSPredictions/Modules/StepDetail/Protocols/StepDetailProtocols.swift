//
//  StepDetailProtocols.swift
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
protocol StepDetailViewProtocol: BaseViewProtocol {
    func configureView(issStep: IssStep?, fact: String?, address: String?)
}

//----------------------------
// MARK: - Interactor
//----------------------------
protocol StepDetailInteractorProtocol {
    var presenter: StepDetailPresenterProtocol? { get set }
    
    func getFacts(request: NumbersFactRequest, onSuccess: @escaping(String?) -> ())
}

//----------------------------
// MARK: - Presenter
//----------------------------
protocol StepDetailPresenterProtocol: BasePresenterProtocol {
    var view: StepDetailViewProtocol? { get set }
    var interactor: StepDetailInteractorProtocol? { get set }
    var router: StepDetailRouterProtocol? { get set }
    
    func hideLoading()
}

//----------------------------
// MARK: - Router
//----------------------------
protocol StepDetailRouterProtocol : BaseRouterProtocol {
    static func launchModule(issStep: IssStep, address: String?) -> UIViewController?
}

//
//  BasePresenterProtocol.swift
//  ISSPredictions
//
//  Created by Francisco Lucena on 9/5/22.
//

import Foundation

protocol BasePresenterProtocol {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

extension BasePresenterProtocol {
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
}

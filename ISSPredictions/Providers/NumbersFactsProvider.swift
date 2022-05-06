//
//  NumbersFactsProvider.swift
//  ISS
//
//  Created by Francisco Lucena on 6/5/22.
//

import Foundation

class NumbersFactsProvider {
    let manager: NumbersFactManager = ServerManager.shared
    
    func getNumberFact(number: String,
                       onSuccess: @escaping(NumbersFactResponse?) -> (),
                       onError: @escaping(Error) -> ()) {
        manager.getNumberFact(number: number, onSuccess: onSuccess, onError: onError)
    }
}

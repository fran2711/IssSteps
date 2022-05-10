//
//  NumbersFactsProvider.swift
//  ISS
//
//  Created by Francisco Lucena on 6/5/22.
//

import Foundation

class NumbersFactsProvider {
    let manager: NumbersFactManager = ServerManager.shared
    
    func getNumberFact(request: NumbersFactRequest,
                       onSuccess: @escaping(NumbersFactResponse?) -> (),
                       onError: @escaping(Error) -> ()) {
        manager.getNumberFact(request: request, onSuccess: onSuccess, onError: onError)
    }
}

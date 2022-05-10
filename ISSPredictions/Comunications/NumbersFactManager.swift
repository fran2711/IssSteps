//
//  NumbersManager.swift
//  ISS
//
//  Created by Francisco Lucena on 6/5/22.
//

import Foundation
protocol NumbersFactManager {
    func getNumberFact(request: NumbersFactRequest,
                       onSuccess: @escaping(NumbersFactResponse?) -> (),
                       onError: @escaping(Error) -> ())
}

extension ServerManager: NumbersFactManager {
    
    func getNumberFact(request: NumbersFactRequest,
                       onSuccess: @escaping(NumbersFactResponse?) -> (),
                       onError: @escaping(Error) -> ()) {
        let completeRequest = Constants.numbersURL + request.number + "?json"
        
        publicRequest(completeRequest, method: .get) { response in
            do {
                let jsonDecoder = JSONDecoder()
                let factsResponse = try jsonDecoder.decode(NumbersFactResponse.self, from: response.data!)
                onSuccess(factsResponse)
            } catch {
                onError(error)
                print(error.localizedDescription)
            }
        } failure: { error in
            onError(error)
        }

    }
}

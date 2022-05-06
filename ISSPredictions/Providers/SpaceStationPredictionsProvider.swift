//
//  SpaceStationProvider.swift
//  ISS
//
//  Created by Francisco Lucena on 6/5/22.
//

import Foundation

class SpaceStationPredictionsProvider {
    let manager: IssManager = ServerManager.shared
    
    func getSpaceStationPredictions(request: SpaceStationPredictionsRequest,
                                    onSuccess: @escaping(SpaceStationPredictionsResponse) -> (),
                                    onError: @escaping(Error) -> ()) {
        manager.getSpaceStationPredictions(request: request, onSuccess: onSuccess, onError: onError)
    }
}

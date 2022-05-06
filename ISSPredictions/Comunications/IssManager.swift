//
//  IssManager.swift
//  ISS
//
//  Created by Francisco Lucena on 5/5/22.
//

import Foundation
import Alamofire

protocol IssManager {
    func getSpaceStationPredictions(request: SpaceStationPredictionsRequest,
                                    onSuccess: @escaping(SpaceStationPredictionsResponse) -> (),
                                    onError: @escaping(Error) -> ())
}

extension ServerManager: IssManager {
    
    func getSpaceStationPredictions(request: SpaceStationPredictionsRequest, onSuccess: @escaping(SpaceStationPredictionsResponse) -> (), onError: @escaping(Error) -> ()) {
        let completeRequest = Constants.spaceStationURL
        guard var urlComponents = URLComponents(string: completeRequest) else { return }
        urlComponents.queryItems = [URLQueryItem(name: "lat", value: request.latitude),
                                     URLQueryItem(name: "lon", value: request.longitude),
                                     URLQueryItem(name: "alt", value: request.altitude),
                                     URLQueryItem(name: "n", value: request.predictions)]
        

        publicRequest(urlComponents, method: .get, parameters: nil) { response in
            do {
                let jsonDecoder = JSONDecoder()
                let predictionsResponse = try jsonDecoder.decode(SpaceStationPredictionsResponse.self, from: response.data!)
                onSuccess(predictionsResponse)
            } catch {
                print(error.localizedDescription)
                onError(error)
            }
        } failure: { error in
            onError(error)
        }


        
    }
}

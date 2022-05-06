//
//  SpaceStationPredictionsResponse.swift
//  ISS
//
//  Created by Francisco Lucena on 6/5/22.
//

import Foundation

struct SpaceStationPredictionsResponse: Codable {
    var message: String?
    var request: SpaceStationPredictionsRequest?
    var response: [PredictionsResponse]?
}

struct PredictionsResponse: Codable {
    var duration: Int?
    var risetime: Int?
}

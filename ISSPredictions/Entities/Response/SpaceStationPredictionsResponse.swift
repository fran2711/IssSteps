//
//  SpaceStationPredictionsResponse.swift
//  ISS
//
//  Created by Francisco Lucena on 6/5/22.
//

import Foundation

struct SpaceStationPredictionsResponse: Codable {
    var response: [IssSteps]?
}

struct IssSteps: Codable {
    var duration: Int?
    var risetime: Int?
}

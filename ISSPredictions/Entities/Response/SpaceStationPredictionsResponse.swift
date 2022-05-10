//
//  SpaceStationPredictionsResponse.swift
//  ISS
//
//  Created by Francisco Lucena on 6/5/22.
//

import Foundation

struct SpaceStationPredictionsResponse: Codable {
    var response: [IssStep]?
}

struct IssStep: Codable {
    var duration: Int?
    var risetime: Int?
}

//
//  SpaceStationPredictionsRequest.swift
//  ISS
//
//  Created by Francisco Lucena on 6/5/22.
//

import Foundation

struct SpaceStationPredictionsRequest: Codable {
    var latitude: String
    var longitude: String
    var altitude: String
    var predictions: String
    
    init(latitude: Double, longitude: Double, altitude: Double) {
        self.latitude = String(latitude)
        self.longitude = String(longitude)
        self.altitude = String(format: "%.0f", altitude)
        self.predictions = "10"
    }
}

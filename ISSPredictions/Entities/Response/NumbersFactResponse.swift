//
//  NumbersFactResponse.swift
//  ISSPredictions
//
//  Created by Francisco Lucena on 6/5/22.
//

import Foundation

struct NumbersFactResponse: Codable {
    var text: String?
    var found: Bool?
    var number: Int?
    var type: String?
    var date: String?
}

//
//  NumbersFactRequest.swift
//  ISS
//
//  Created by Francisco Lucena on 6/5/22.
//

import Foundation

struct NumbersFactRequest {
    var number: String
    
    init(number: Int) {
        self.number = String(number)
    }
}

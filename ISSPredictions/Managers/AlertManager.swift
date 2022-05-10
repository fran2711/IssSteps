//
//  AlertManager.swift
//  ISSPredictions
//
//  Created by Francisco Lucena on 10/5/22.
//

import Foundation
import UIKit

class AlertManager {
        
    static func createErrorAlert(title: String?, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        return alert
    }
}

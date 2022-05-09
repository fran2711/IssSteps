//
//  StoryboardHandler.swift
//  ISSPredictions
//
//  Created by Francisco Lucena on 9/5/22.
//

import Foundation
import UIKit

enum StoryboardName: String {
    case main = "Main"
}

enum ViewControllerId: String {
    case issSteps = "IssStepsViewController"
    case splash = "SplashViewController"
    
    var storyboard: StoryboardName {
        switch self {
        case .splash, .issSteps:
            return .main
        }
    }
}

class StoryboardHandler {
    static func instantiateViewController(_ identifier: ViewControllerId) -> UIViewController {
        return UIStoryboard(name: identifier.storyboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: identifier.rawValue)
    }
    
    static func instantiateInitialViewController(_ storyboard: StoryboardName) -> UIViewController {
        guard let initialViewController = UIStoryboard(name: storyboard.rawValue, bundle: nil).instantiateInitialViewController() else {
            assertionFailure("There is not view controller set as root for this storyboard")
            return UIViewController()
        }
        return initialViewController
    }
    
}

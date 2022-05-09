//
//  BaseRouterProtocol.swift
//  ISSPredictions
//
//  Created by Francisco Lucena on 9/5/22.
//

import Foundation
import UIKit

public enum NavigationRouterType {
    case push
    case present
    case asRootWithNav
}

protocol BaseRouterProtocol {
    func push(from view: UIViewController?, to toView: UIViewController?)
    func present(from view: UIViewController?, to toView: UIViewController?)
    
    func startNavigation(navigationType: NavigationRouterType, view: UIViewController?, from: UIViewController?)
}

class BaseRouter: BaseRouterProtocol {
    public func push(from view: UIViewController?, to toView: UIViewController?) {
        if let toView = toView {
            view?.navigationController?.pushViewController(toView, animated: true)
        }
    }
    
    public func present(from view: UIViewController?, to toView: UIViewController?) {
        if let toView = toView {
            view?.present(toView, animated: true)
        }
    }
    
    public func startNavigation(navigationType: NavigationRouterType, view: UIViewController?, from: UIViewController?) {
        guard let view = view else { return }
        
        switch navigationType {
        case .push:
            from?.navigationController?.pushViewController(view, animated: false)
            break
        case .present:
            from?.present(view, animated: true, completion: nil)
            break
        case .asRootWithNav:
            presentViewController(viewController: UINavigationController(rootViewController: view))
            break
        }
    }
    
    private func presentViewController(viewController: UIViewController) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.window?.rootViewController = viewController
            appDelegate.window?.makeKeyAndVisible()
        }
    }
}

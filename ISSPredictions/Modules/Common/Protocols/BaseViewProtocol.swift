//
//  BaseViewProtocol.swift
//  ISSPredictions
//
//  Created by Francisco Lucena on 9/5/22.
//

import Foundation
import UIKit

protocol BaseViewProtocol {
    func showLoading()
    func hideLoading()
    func showAlert(_ alert: UIAlertController)
    func errorAlert(errorMessage: String, title: String?) -> UIAlertController
}

extension UIViewController: BaseViewProtocol {
    
    func loadViewController() -> UIViewController {
        let loadingVC = LoadingViewController()
        loadingVC.modalPresentationStyle = .overCurrentContext
        loadingVC.modalTransitionStyle = .crossDissolve
        return loadingVC
    }
    
    func showLoading() {
        self.present(loadViewController(), animated: true)
    }
    
    func hideLoading() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func errorAlert(errorMessage: String, title: String?) -> UIAlertController {
        return AlertManager.createErrorAlert(title: title, message: errorMessage)
    }
    
    func showAlert(_ alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
}

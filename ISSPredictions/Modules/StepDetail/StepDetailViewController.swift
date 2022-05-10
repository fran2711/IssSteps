//
//  StepDetailViewController.swift
//  Xfera
//
//  Created by Francisco Lucena on 9/5/22.
//  Copyright © 2020 Xfera Consumer Finance EFC SA. All rights reserved.
//

import Foundation
import UIKit

class StepDetailViewController: BaseViewController {
    
    var presenter: StepDetailPresenterProtocol!
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var timeUntilStepLabel: UILabel!
    @IBOutlet weak var timeStepLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var stepDurationLabel: UILabel!
    @IBOutlet weak var durationAndFactLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        title = Constants.detailStepTitle
        navigationItem.backButtonTitle = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
    
    func configureView(issStep: IssStep?, fact: String?, address: String?) {
        timeUntilStepLabel.text = Constants.timeUntilStep
        addressLabel.text = address
        if let riseTime = issStep?.risetime {
            timeStepLabel.text = String(riseTime)
        }
        stepDurationLabel.text = issStep?.risetime?.converToDurationTime(initialText: Constants.timeStepWillLast)
        if let duration = issStep?.duration, let fact = fact {
            durationAndFactLabel.text = String(duration) + " " + Constants.secondsAndFact + " " + fact
        }
        
        self.hideLoading()
    }
}

//----------------------------
// MARK: - Protocol
//----------------------------
extension StepDetailViewController: StepDetailViewProtocol{

}

//
//  IssStepsViewController.swift
//  Xfera
//
//  Created by Francisco Lucena on 9/5/22.
//  Copyright © 2020 Xfera Consumer Finance EFC SA. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class IssStepsViewController: BaseViewController {
    var presenter: IssStepsPresenterProtocol!
    
    @IBOutlet weak var stepsTableView: UITableView!
    @IBOutlet weak var currentLocationLabel: UILabel!
    
    var issSteps: [IssStep] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        title = Constants.stepsTitle
        stepsTableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: MainTableViewCell.identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
    
    
}

extension IssStepsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issSteps.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        let step = issSteps[indexPath.row]
        cell.configure(step: step)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(issSteps[indexPath.row])
        presenter.selectedStep(issSteps[indexPath.row])
    }
    
    
}



//----------------------------
// MARK: - Protocol
//----------------------------
extension IssStepsViewController: IssStepsViewProtocol{

    func showSteps(steps: [IssStep]) {
        self.issSteps = steps
        stepsTableView.reloadData()
    }
    
    func updateLocation(_ location: String) {
        self.currentLocationLabel.text = location
    }
}

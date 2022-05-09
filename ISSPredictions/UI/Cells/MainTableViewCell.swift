//
//  MainTableViewCell.swift
//  ISSPredictions
//
//  Created by Francisco Lucena on 6/5/22.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let identifier = "IssStepsCellId"
    @IBOutlet weak var stepTimeLabel: UILabel!
    @IBOutlet weak var stepDurationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
    }
    
    func configure(step: IssSteps) {
        stepDurationLabel.text = step.duration?.converToDurationTime()
        stepTimeLabel.text = step.risetime?.getWeekdayAndHourFromRiseTime()
    }
    
}

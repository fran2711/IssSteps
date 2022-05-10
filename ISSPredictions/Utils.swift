//
//  Utils.swift
//  ISSPredictions
//
//  Created by Francisco Lucena on 9/5/22.
//

import Foundation
import UIKit

extension Int {
    func converToDurationTime(initialText: String) -> String {
        let (m, s) = ((self % 3600) / 60, (self % 3600) % 60)
        
        return "\(initialText) \(m) minutos y \(s) segundos"
    }
    
    func getWeekdayAndHourFromRiseTime() -> String {
        let epocTime = TimeInterval(self)
        let myDate = Date(timeIntervalSince1970: epocTime)
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es_ES")
        let weekday = formatter.weekdaySymbols[Calendar.current.component(.weekday, from: myDate) - 1].capitalizingFirstLetter()
        formatter.dateFormat = ("dd' de 'MMMM' a las 'hh':'mm'")
        let dayAndHour = formatter.string(from: myDate)
        
        return "\(weekday) \(dayAndHour)"
    }
}


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}

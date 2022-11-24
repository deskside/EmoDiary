//
//  DataController.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/24.
//

import Foundation

struct DateController{
    
    static func dateToString(date:Date, dateFormat:String = Constants.dateFormatterDateHourMinute) -> String{
        let formatter = DateFormatter()
        formatter.locale = Locale.init(identifier: Constants.defaultTimeIdentifier)
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: date)
        return date
    }
}

//
//  Date+Format.swift
//  InterviewGS
//
//  Created by David on 10/8/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

extension Date {
    
    func toFormat(_ format: String = "dd-MM-yyyy") -> String {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        var strDate = dateFormatter.string(from: self)
        return strDate
    }
    
}

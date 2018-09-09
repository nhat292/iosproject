//
//  Date+Extension.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/9/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import Foundation

extension Date {
    
    var formatDateOfApp: String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormater.string(from: self)
    }
    
    func dateStringWithFormat(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self as Date)
    }
}

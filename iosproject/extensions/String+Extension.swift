//
//  String+Extension.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/9/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func localized(lang: String, tableName: String) -> String {
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: tableName, bundle: bundle!, value: "", comment: "")
    }
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    mutating func trimTrailingWhitespace() {
        if let trailingWs = self.range(of: "\\s+$", options: .regularExpression) {
            self.replaceSubrange(trailingWs, with: "")
        }
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailFinal = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailFinal.evaluate(with: self)
    }
    
    func isValidPhoneNumber() -> Bool {
        let PHONE_REGEX = "^0\\d{9,}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    var attributedStringFromHtml: NSAttributedString {
        let attrStr = try! NSAttributedString (
            data: (self.data(using: String.Encoding.unicode, allowLossyConversion: true))!,
            options: [.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue, kCTForegroundColorAttributeName as NSAttributedString.DocumentReadingOptionKey: UIColor.white],
            documentAttributes: nil)
        return attrStr
    }
    
    
    func getDayOfMonthSuffix(n : Int) -> String {
        if n >= 11 && n <= 13 {
            return "th"
        }
        switch n % 10 {
        case 1:
            return "st"
        case 2:
            return "nd"
        case 3:
            return "rd"
        default:
            return "th"
        }
    }
    
    var removeSuffix: String {
        var stringSplit = self.components(separatedBy: " ")
        var string = stringSplit[0].replacingOccurrences(of: "st", with: "")
        string = string.replacingOccurrences(of: "th", with: "")
        string = string.replacingOccurrences(of: "nd", with: "")
        string = string.replacingOccurrences(of: "rd", with: "")
        return "\(string) \(stringSplit[1]) \(stringSplit[2])"
    }
    
    var isHtmlLink: Bool {
        if let url = URL(string: self) {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
}

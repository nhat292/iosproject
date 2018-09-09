//
//  UIAlertController+Extension.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/10/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    func applyAppStyle() {
        //Change the background
        let subview = self.view.subviews.first! as UIView
        subview.backgroundColor = UIColor.clear
        subview.layer.borderWidth = 1
        subview.layer.cornerRadius = 10
        subview.layer.borderColor = UIColor.black.cgColor
        
        /*//Change the title color
         if let title = title {
         var titleMutableString = NSMutableAttributedString()
         titleMutableString = NSMutableAttributedString(string: title as String, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 20)])
         titleMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSRange(location: 0,length: title.characters.count))
         self.setValue(titleMutableString, forKey: "attributedTitle")
         }
         
         //Change the message color
         if let message = message {
         var messageMutableString = NSMutableAttributedString()
         messageMutableString = NSMutableAttributedString(string: message as String, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)])
         messageMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSRange(location: 0,length: message.characters.count))
         self.setValue(messageMutableString, forKey: "attributedMessage")
         }
         
         //Change button text color
         self.view.tintColor = UIColor.white*/
    }
}

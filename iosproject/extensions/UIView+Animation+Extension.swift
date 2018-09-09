//
//  UIView+Animation+Extension.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/8/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func showHide() {
        if isHidden {
            self.isHidden = false
            self.alpha = 0.0
            UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseOut, animations: {
                self.alpha = 1.0
            }, completion: nil)
        } else {
            self.alpha = 1.0
            UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseIn, animations: {
                self.alpha = 0.0
            }) { (completed) in
                self.isHidden = true
            }
        }
    }
    
}

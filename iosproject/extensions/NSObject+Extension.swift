//
//  NSObject+Extension.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/9/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    
    func addTapGestureRecognizer(view: UIView, ac: Selector?) {
        let gesture = UITapGestureRecognizer(target: self, action: ac)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(gesture)
    }
    
}

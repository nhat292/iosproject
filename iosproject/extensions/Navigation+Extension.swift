//
//  Navigation+Extension.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/9/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationItem {
    
    func hideBackButton() {
        self.setHidesBackButton(true, animated: false)
    }
}

extension UINavigationBar {
    func transparentNavigationBar() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
    }
    
    func offTransparentNavigationBar() {
        self.barTintColor = UIColor.white
        self.isTranslucent = false
        self.barTintColor = UIColor.brown
    }
}

extension UINavigationController {
    
    override open var shouldAutorotate: Bool {
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.shouldAutorotate
            }
            return super.shouldAutorotate
        }
    }
    
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.preferredInterfaceOrientationForPresentation
            }
            return .portrait
        }
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.supportedInterfaceOrientations
            }
            return .portrait
        }
    }
}

//
//  ProgressBarView.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/8/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import UIKit

class ProgressBarView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        UIView.animateKeyframes(withDuration: 0.5, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            self.alpha = 0.1
        }, completion: nil)
    }
    
}

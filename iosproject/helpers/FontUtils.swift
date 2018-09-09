//
//  FontUtils.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/10/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import Foundation
import UIKit

class FontUtils {
    
    class func printFonts() {
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
        }
    }
}

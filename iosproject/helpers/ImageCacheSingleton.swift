//
//  ImageCacheSingleton.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/8/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import Foundation
import SDWebImage

enum PlaceholderOrientation: Int {
    case horizontal = 0
    case vertical = 1
}

class ImageCacheSingleton {
    
    static let shared = ImageCacheSingleton()
    
    fileprivate let cache: SDImageCache!
    fileprivate let placeholderH: UIImage!
    fileprivate let placeholderV: UIImage!
    
    fileprivate init() {
        placeholderH = UIImage(named: "PlaceholderH")
        placeholderV = UIImage(named: "PlaceholderV")
        
        cache = SDImageCache(namespace: "RxPlacesImageCache")
    }
    
    func imageCache() -> SDImageCache {
        return cache
    }
    
    func placeholder(_ orientation: PlaceholderOrientation) -> UIImage {
        switch orientation {
        case .horizontal:
            return placeholderH
        case .vertical:
            return placeholderV
        }
    }
    
}

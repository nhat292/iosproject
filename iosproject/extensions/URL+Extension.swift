//
//  URL+Extension.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/10/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import Foundation

extension URL {
    
    subscript(queryParam: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParam })?.value
    }
    
}

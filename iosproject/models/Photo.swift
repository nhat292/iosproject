//
//  Photo.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/8/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import Foundation

struct Photo: Decodable {
    
    var reference: String!
    var w: Int!
    var h: Int!
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PhotoStructureKey.self)
        reference = try container.decode(String.self, forKey: .reference)
        w = try container.decode(Int.self, forKey: .w)
        h = try container.decode(Int.self, forKey: .h)
    }
    
    init() {
        
    }
}

extension Photo {
    
    enum PhotoStructureKey: String, CodingKey {
        case reference =  "photo_reference"
        case w = "width"
        case h = "height"
    }
    
}

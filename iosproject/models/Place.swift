//
//  Place.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/8/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import Foundation

struct Place: Decodable {
    
    var id: String!
    var name: String!
    var vicinity: String?
    var iconURL: String?
    var rating: Double?
    var photos: [Photo]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PlaceStructureKey.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        vicinity = try container.decode(String.self, forKey: .vicinity)
        iconURL = try container.decode(String.self, forKey: .iconURL)
        rating = try container.decode(Double.self, forKey: .rating)
        photos = try container.decode([Photo].self, forKey: .photos)
    }
    
    init() {
        
    }
}

extension Place {
    
    enum PlaceStructureKey: String, CodingKey {
        case id = "id"
        case name = "name"
        case vicinity = "vicinity"
        case iconURL = "icon"
        case rating = "rating"
        case photos = "photos"
    }
    
}

//
//  Result.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/8/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import Foundation

struct Result: Decodable {
    
    var nextPageToken: String?
    var places: [Place]?
    var status: String!
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultStructureKey.self)
        nextPageToken = try container.decode(String.self, forKey: .nextPageToken)
        places = try container.decode([Place].self, forKey: .places)
        status = try container.decode(String.self, forKey: .status)
    }
    
    init() {
    }
}

extension Result {
    
    enum ResultStructureKey: String, CodingKey {
        case nextPageToken = "next_page_token"
        case places = "results"
        case status = "status"
    }
    
}

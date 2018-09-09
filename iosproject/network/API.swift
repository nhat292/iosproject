//
//  GooglePlaces.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/8/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import Foundation
import Moya

struct APIKey {
    static let token = "AIzaSyDffA3hy-NGKiioEwNg6jtSFI3qaOsxCpA"
}

enum API: TargetType {
    
    case getPlaces(location: String, type: Type, radius: Int, key: String)
    case getPhoto(photo: Photo, key: String)
    case getNextPage(nextPageToken: String, key: String)
    
    var baseURL: URL {
        return URL(string: "https://maps.googleapis.com/maps/api/place")!
    }
    
    var path: String {
        switch self {
        case .getPlaces:
            return "/nearbysearch/json"
        case .getPhoto:
            return "/photo"
        case .getNextPage:
            return "/nearbysearch/json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPlaces, .getPhoto, .getNextPage:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        case .getPlaces, .getPhoto, .getNextPage:
            return .requestPlain
        }
        
    }
    
    var headers: [String : String]? {
        return ["": ""]
    }
    
}

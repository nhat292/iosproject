//
//  PlaceViewModel.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/9/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import Foundation
import RxSwift

class PlaceViewModel: BaseViewModel {
    
    func loadPlaces(_ location: String, type: Type, radius: Int) -> Observable<Result> {
        return requestJsonRx(api: .getPlaces(location: location, type: type, radius: radius, key: APIKey.token)).map({ json in
            let data = try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            if let result = try? JSONDecoder().decode(Result.self, from: data) {
                return result
            } else {
                throw ErrorResponse.invalidJSONFormat
            }
        })
    }
    
}

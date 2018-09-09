//
//  PlaceViewModel.swift
//  iosproject
//
//  Created by Nguyen Van Nhat on 9/8/18.
//  Copyright © 2018 Nguyen Van Nhat. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class BaseViewModel: NSObject {

    var disposeBag: DisposeBag! = DisposeBag()
    var provider: MoyaProvider<API>! = MoyaProvider<API>()
    
    func requestJsonRx(api: API) -> Observable<Dictionary<String, Any>> {
        return Observable.create({ (observer) -> Disposable in
            let request = self.provider.request(api, completion: { (result) in
                do {
                    switch result {
                    case .success(let response):
                        let json = try response.mapJSON()
                        if let jsonDict = json as? Dictionary<String, Any> {
                            observer.onNext(jsonDict)
                            observer.onCompleted()
                        } else {
                            throw ErrorResponse.invalidJSONFormat
                        }
                    case .failure(let error):
                        throw error
                    }
                } catch let error {
                    observer.onError(error)
                    observer.onCompleted()
                }
            })
            return Disposables.create {
                request.cancel()
            }
        })
    }
}

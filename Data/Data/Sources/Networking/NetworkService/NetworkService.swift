//
//  NetworkService.swift
//  Data
//
//  Created by Владимир on 13.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Moya
import RxSwift

protocol NetworkService: AnyObject {
  func execute<Target: NetworkTargetType, Value: Decodable>(_ target: Target, with type: Value.Type) -> Single<Value>
  func execute<Target: NetworkTargetType>(_ target: Target) -> Completable
}

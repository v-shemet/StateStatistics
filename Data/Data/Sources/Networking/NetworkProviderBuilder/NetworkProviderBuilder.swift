//
//  NetworkProviderBuilder.swift
//  Data
//
//  Created by Владимир on 13.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Moya

protocol NetworkProviderBuilder {
  func provider<T: NetworkTargetType>(for type: T.Type) -> Moya.MoyaProvider<T>
  func provider<T: NetworkTargetType>(stubClosure: @escaping MoyaProvider<T>.StubClosure) -> Moya.MoyaProvider<T>
}

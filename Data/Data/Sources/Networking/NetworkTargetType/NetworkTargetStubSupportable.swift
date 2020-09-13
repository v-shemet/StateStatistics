//
//  NetworkTargetStubSupportable.swift
//  Data
//
//  Created by Владимир on 13.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Moya

protocol NetworkTargetStubSupportable: NetworkTargetType {
  var stubBehavior: Moya.StubBehavior { get }
}

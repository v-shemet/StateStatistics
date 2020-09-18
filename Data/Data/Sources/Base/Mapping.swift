//
//  Mapping.swift
//  DataKit
//
//  Created by Владимир on 18.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Foundation

protocol Mapping {
  associatedtype From
  associatedtype To // swiftlint:disable:this type_name
    
  func map(_ item: From) throws -> To
  func map(_ itemList: [From]) throws -> [To]
}

extension Mapping {
  func map(_ itemList: [From]) throws -> [To] {
    try itemList.map(map)
  }
}

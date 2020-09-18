//
//  ReverseMapping.swift
//  DataKit
//
//  Created by Владимир on 18.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Foundation

protocol ReverseMapping: Mapping {
  func reverse(_ item: To) throws -> From
  func reverse(_ itemList: [To]) throws -> [From]
}

extension ReverseMapping {
  func reverse(_ itemList: [To]) throws -> [From] {
    try itemList.map(reverse)
  }
}

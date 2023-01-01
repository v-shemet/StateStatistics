//
//  ProductionIndex.swift
//  DomainKit
//
//  Created by Vladimir Shemet on 01.01.2023.
//  Copyright © 2023 Vladimir Shemet. All rights reserved.
//

import Foundation

public struct ProductionIndex {
  public let year: Int
  public let index: Int
  
  public init(year: Int, index: Int) {
    self.year = year
    self.index = index
  }
}

//
//  ProductionIndexMapper.swift
//  DataKit
//
//  Created by Vladimir Shemet on 01.01.2023.
//  Copyright © 2023 Vladimir Shemet. All rights reserved.
//

import DomainKit
import Foundation

final class ProductionIndexMapper: Mapping {
  func map(_ item: ProductionIndexEntity) throws -> ProductionIndex {
    ProductionIndex(
      year: item.year,
      index: item.index
    )
  }
}
